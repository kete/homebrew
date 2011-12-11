require 'formula'

# currently the dependency on brew's version of libxml2 is necessary
# to avoid this: https://gist.github.com/1458566

class Yaz < Formula
  url 'http://ftp.indexdata.dk/pub/yaz/yaz-4.2.22.tar.gz'
  homepage 'http://www.indexdata.com/yaz'
  md5 'b28ecda4073a950a1f915829475e5238'

  depends_on 'libxml2'
  depends_on 'pkg-config' => :build

  def install
    system "./configure", "--disable-dependency-tracking",
                          "--prefix=#{prefix}",
                          "--with-xml2"
    system "make install"
  end
end
