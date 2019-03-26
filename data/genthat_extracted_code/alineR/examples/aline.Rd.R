library(alineR)


### Name: aline
### Title: Calculate aline distances
### Aliases: aline

### ** Examples

x<-c(intToUtf8(c(361,109,108,97,116,952)),intToUtf8(c(100,105,331,331,105,114,97)))
y<-c(intToUtf8(c(418,109,108,97,116,952)),intToUtf8(c(100,105,110,110,105,114,97)))
# For CRAN requirement, to see x and y, type x,y in R console
x
y
aline(w1=x,w2=y)   # A warning is returned because of unknown character

# user substitution
aline(w1=x,w2=y,m1=intToUtf8(418),m2="o")



