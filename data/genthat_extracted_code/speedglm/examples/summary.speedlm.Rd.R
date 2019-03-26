library(speedglm)


### Name: summary.speedlm
### Title: Methods to summarize Linear Models fits
### Aliases: summary.speedlm coef.speedlm vcov.speedlm logLik.speedlm
###   AIC.speedlm
### Keywords: models

### ** Examples


y <- rnorm(100,1.5,1)
x <- round(matrix(rnorm(200), 100, 2), digits = 3)
colnames(x) <- c("s1","s2")
da <- data.frame(y, x)

m <- speedlm(y ~ s1 + s2,da)
summary(m)



