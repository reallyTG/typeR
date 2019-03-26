library(lava)


### Name: plot.sim
### Title: Plot method for simulation 'sim' objects
### Aliases: plot.sim density.sim

### ** Examples

n <- 1000
val <- cbind(est1=rnorm(n,sd=1),est2=rnorm(n,sd=0.2),est3=rnorm(n,1,sd=0.5),
             sd1=runif(n,0.8,1.2),sd2=runif(n,0.1,0.3),sd3=runif(n,0.25,0.75))

plot.sim(val,estimate=c(1,2),true=c(0,0),se=c(4,5),equal=TRUE,scatter.plot=TRUE)
plot.sim(val,estimate=c(1,3),true=c(0,1),se=c(4,6),xlim=c(-3,3),
	scatter.ylim=c(-3,3),scatter.plot=TRUE)
plot.sim(val,estimate=c(1,2),true=c(0,0),se=c(4,5),equal=TRUE,
	plot.type="single",scatter.plot=TRUE)
plot.sim(val,estimate=c(1),se=c(4,5,6),plot.type="single",scatter.plot=TRUE)
plot.sim(val,estimate=c(1,2,3),equal=TRUE,scatter.plot=TRUE)
plot.sim(val,estimate=c(1,2,3),equal=TRUE,byrow=TRUE,scatter.plot=TRUE)
plot.sim(val,estimate=c(1,2,3),plot.type="single",scatter.plot=TRUE)
plot.sim(val,estimate=1,se=c(3,4,5),plot.type="single",scatter.plot=TRUE)

density.sim(val,estimate=c(1,2,3),density=c(0,10,10),angle=c(0,45,-45))



