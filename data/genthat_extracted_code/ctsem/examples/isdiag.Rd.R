library(ctsem)


### Name: isdiag
### Title: Diagnostics for ctsem importance sampling
### Aliases: isdiag

### ** Examples

## Not run: 
##D #get data
##D sunspots<-sunspot.year
##D sunspots<-sunspots[50: (length(sunspots) - (1988-1924))]
##D id <- 1
##D time <- 1749:1924
##D datalong <- cbind(id, time, sunspots)
##D 
##D #setup model
##D model <- ctModel(type='stanct', n.latent=2, n.manifest=1, 
##D  manifestNames='sunspots', 
##D  latentNames=c('ss_level', 'ss_velocity'),
##D   LAMBDA=matrix(c( -1, 'ma1' ), nrow=1, ncol=2),
##D   DRIFT=matrix(c(-.0001, 'a21', 1, 'a22'), nrow=2, ncol=2),
##D   MANIFESTMEANS=matrix(c('m1'), nrow=1, ncol=1),
##D   CINT=matrix(c(0, 0), nrow=2, ncol=1),
##D   T0VAR=matrix(c(1,0,0,1), nrow=2, ncol=2), #Because single subject
##D   DIFFUSION=matrix(c(0.0001, 0, 0, "diffusion"), ncol=2, nrow=2))
##D 
##D model$pars$indvarying<-FALSE #Because single subject
##D model$pars$transform[14]<- '(param)*5+44 ' #Because not mean centered
##D model$pars$transform[4]<-'-log(exp(-param*1.5)+1)' #To avoid multi modality
##D 
##D #fit and plot importance sampling diagnostic
##D fit <- ctStanFit(datalong, model, chains=1,optimcontrol=list(isloops=5,issamples=500),optimize=TRUE)
##D isdiag(fit)
## End(Not run)



