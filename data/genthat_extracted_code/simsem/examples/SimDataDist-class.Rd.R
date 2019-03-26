library(simsem)


### Name: SimDataDist-class
### Title: Class '"SimDataDist"': Data distribution object
### Aliases: SimDataDist-class summary,SimDataDist-method
###   plotDist,SimDataDist-method
### Keywords: classes

### ** Examples

showClass("SimDataDist")

d1 <- list(df=2)
d2 <- list(df=3)
d3 <- list(df=4)
d4 <- list(df=5)
d5 <- list(df=3)
d6 <- list(df=4)
d7 <- list(df=5)
d8 <- list(df=6)

dist <- bindDist(c(rep("t", 4), rep("chisq", 8)), d1, d2, d3, d4, d5, d6, d7, d8, d5, d6, d7, d8)
summary(dist)

dist2 <- bindDist(skewness = seq(-3, 3, length.out=12), kurtosis = seq(2, 5, length.out=12))
summary(dist2)



