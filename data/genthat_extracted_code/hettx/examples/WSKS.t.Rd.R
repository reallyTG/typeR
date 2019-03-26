library(hettx)


### Name: WSKS.t
### Title: WSKS.t
### Aliases: WSKS.t

### ** Examples

df <- make.randomized.dat( 1000, gamma.vec=c(1,1,1,2), beta.vec=c(-1,-1,1,0) )
df$W <- sample(c("A", "B", "C"), nrow(df), replace = TRUE)
WSKS.t(df$Yobs, df$Z, df$W)




