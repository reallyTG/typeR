library(Nippon)


### Name: sjis2utf8
### Title: Wrapper of iconv for Japanese encoding
### Aliases: sjis2utf8 eucjp2utf8 jis2utf8
### Keywords: character Japanese language

### ** Examples

x <- iconv(zenkaku$upper, from="UTF-8", to="CP932")
sjis2utf8(x)



