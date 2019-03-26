library(hettx)


### Name: variance.ratio.test
### Title: Variance ratio test
### Aliases: variance.ratio.test

### ** Examples

df <- make.randomized.dat( 1000, gamma.vec=c(1,1,1,2), beta.vec=c(-1,-1,1,0) )
variance.ratio.test(df$Yobs, df$Z)




