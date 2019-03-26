library(gsg)


### Name: fitness.landscape
### Title: A function to estimate fitness landscapes, i.e. the relationship
###   between popualtion mean fitness and population mean phenotype.
### Aliases: fitness.landscape
### Keywords: ~kwd1 ~kwd2

### ** Examples

# simulated data (stabilizing selection)
z<-rnorm(200,0,2)
W<-rpois(200,exp(1-1*z^2))
d<-as.data.frame(list(W=W,z=z))

# characterize the fitness function
library(mgcv)
ff<-gam(W~s(z),family='poisson',data=d)

# characterize fitness landscape
fl<-fitness.landscape(mod=ff,phenotype="z",PI.method='n')

# (not run) plotting
# plot(fl$points[,1],fl$Wbar,type='l')
# lines(fl$points[,1],fl$WbarPI[1,],lty='dashed')
# lines(fl$points[,1],fl$WbarPI[2,],lty='dashed')




