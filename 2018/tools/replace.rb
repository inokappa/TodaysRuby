#!/usr/bin/ruby

# 置換対象文字列
str = '2019/'

# ファイルを修正するメソッド
def replaceString(f, str)
  f.rewind
  body = f.read
  body = body.gsub(str) do |tmp|
   # この文字列で置き換える
   '2018/'
  end
  f.rewind
  f.puts body
end

# カレントディレクトリのファイル取得
files = Dir.glob('*.md')

# ファイル 1 つずつを処理
files.each do |item|
  # ファイルを開く
  open(item, 'r+') {|f|  
    f.flock(File::LOCK_EX)
    replaceString(f,str)
    f.truncate(f.tell)
  }
end
