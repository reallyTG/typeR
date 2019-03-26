library(ctsem)


### Name: optimstan
### Title: Optimize / importance sample a stan or ctStan model.
### Aliases: optimstan

### ** Examples

 sunspots<-sunspot.year
 sunspots<-sunspots[50: (length(sunspots) - (1988-1924))]
 id <- 1
 time <- 1749:1924
datalong <- cbind(id, time, sunspots)

#setup model
 ssmodel <- ctModel(type='stanct', n.latent=2, n.manifest=1,
  manifestNames='sunspots',
  latentNames=c('ss_level', 'ss_velocity'),
   LAMBDA=matrix(c( 1, 'ma1' ), nrow=1, ncol=2),
   DRIFT=matrix(c(0, 'a21', 1, 'a22'), nrow=2, ncol=2),
   MANIFESTMEANS=matrix(c('m1'), nrow=1, ncol=1),
   MANIFESTVAR=diag(0,1),
   CINT=matrix(c(0, 0), nrow=2, ncol=1),
   T0VAR=matrix(c(1,0,0,1), nrow=2, ncol=2), #Because single subject
   DIFFUSION=matrix(c(0, 0, 0, "diffusion"), ncol=2, nrow=2))

 ssmodel$pars$indvarying<-FALSE #Because single subject
 ssmodel$pars$offset[14]<- 44 #Because not mean centered
 ssmodel$pars[4,c('transform','offset')]<- c(1,0) #To avoid multi modality

#fit using optimization without importance sampling
ssfit <- ctStanFit(datalong[1:50,], #limited data for example
  ssmodel, optimize=TRUE,optimcontrol=list(deoptim=FALSE,isloops=0,issamples=50))

#output
summary(ssfit)



