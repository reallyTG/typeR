library(alineR)


### Name: decode.ALINE
### Title: Decode ALINE ASCII output
### Aliases: decode.ALINE

### ** Examples

x<-intToUtf8(c(611,117,108,108,97))
y<-"|         gS       u       l       l       a       |  "
decode.ALINE(x,y)

# user-specified mapping. Should be consistent with encode.ALINE() function
x<-intToUtf8(c(418,109,108,97,116,952))
y<-"|  o   m   l   a   t   tS  |  "
decode.ALINE(x,y,m1=intToUtf8(418), m2="o")



