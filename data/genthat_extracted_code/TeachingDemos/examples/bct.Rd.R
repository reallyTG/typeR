library(TeachingDemos)


### Name: bct
### Title: Box-Cox Transforms
### Aliases: bct
### Keywords: manip datagen regression

### ** Examples

y <- rlnorm(500, 3, 2)
par(mfrow=c(2,2))
qqnorm(y)
qqnorm(bct(y,1/2))
qqnorm(bct(y,0))
hist(bct(y,0))






