library(Hmisc)


### Name: mtitle
### Title: Margin Titles
### Aliases: mtitle
### Keywords: hplot

### ** Examples

#Set up for 1 plot on figure, give a main title,
#use date for lr
plot(runif(20),runif(20))
mtitle("Main Title")


#Set up for 2 x 2 matrix of plots with a lower left subtitle and overall title
par(mfrow=c(2,2), oma=c(3,0,3,0))
plot(runif(20),runif(20))
plot(rnorm(20),rnorm(20))
plot(exp(rnorm(20)),exp(rnorm(20)))
mtitle("Main Title",ll="n=20")



