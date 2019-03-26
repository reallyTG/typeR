library(lassoscore)


### Name: glassoscore
### Title: Penalized score test, for the graphical lasso.
### Aliases: glassoscore mbscore

### ** Examples

set.seed(100)

x<-matrix(rnorm(50*20),ncol=20)

gl <- glassoscore(x,0.2)
mb <- mbscore(x,0.2)

par(mfrow=c(1,2))
plot(gl)
plot(mb)



