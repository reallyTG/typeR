library(longitudinalData)


### Name: reshapeWideToLong
### Title: ~ Function: wideToLong (or reshapeWideToLong) ~
### Aliases: reshapeWideToLong wideToLong

### ** Examples

df3 <- data.frame(id = LETTERS[rep(1:4)], sex=c("H","F","H","F"),
    v1=rnorm(4),v2=rnorm(4),w1=rnorm(4),w2=rnorm(4))

wideToLong(df3[,c(1,3,4)])
wideToLong(df3[,c(1,5,6)])
wideToLong(df3[,c(1,3:6)])
wideToLong(df3[,c(1,3:6)],times=c(1,2,4,8))



