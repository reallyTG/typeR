library(Biolinv)


### Name: spatSim
### Title: Computes spatial dissimilarity of two point processes.
### Aliases: spatSim

### ** Examples

ran<- data.frame('y'=sample(1000),'x'=sample(1000))
nor<- data.frame('y'=rnorm(1000,sd=150,mean=500),'x'=rnorm(1000,sd=150,mean=500))
window<-  spatstat::owin(xrange=c(0,1000),yrange=c(0,1000))
spatSim(ran, nor, WINDOW= window, R=0:200)



