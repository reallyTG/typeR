library(plfm)


### Name: plot.stepLCplfm
### Title: Plot fit of 'stepLCplfm' objects
### Aliases: plot.stepLCplfm

### ** Examples


## Not run: 
##D # example 1: analysis on determinants of anger-related behavior
##D 
##D # load anger data
##D data(anger)
##D 
##D # compute 5 runs of disjunctive latent class probabilistic feature models
##D # with 1 up to 3 features and with 1 up to 2 latent classes
##D # assume constant situation classification per person 
##D # and class-specific situation parameters (i.e. model=1) 
##D 
##D anger.lst<-stepLCplfm(minF=1,maxF=3,minT=1,maxT=2,data=anger$data,
##D                       maprule="disj",M=5,emcrit1=1e-3,emcrit2=1e-8,model=1)
##D 
##D 
##D # visualize BIC of fitted models 
##D 
##D par(pty="s")
##D plot(anger.lst)
##D 
##D # print overview fit measures for all estimated models
##D 
##D anger.lst
##D 
##D # print model with 3 features and 1 latent class
##D 
##D anger.lst[[3,1]]
## End(Not run)

## Not run: 
##D # example 2:Perceptual analysis of associations between car models and car attributes
##D 
##D # load car data
##D data(car)
##D 
##D 
##D # compute 5 runs of disjunctive models with 4 features and 1 up to 3 latent classes
##D # assume constant attribute classification per respondent 
##D # and class-specific car parameters (i.e. model 4)
##D 
##D car.lst<-stepLCplfm(minF=4,maxF=4,minT=1,maxT=3,data=car$data3w,
##D                       maprule="disj",M=5,emcrit1=1e-3,emcrit2=1e-8,model=4,printrun=TRUE)
##D 
##D 
##D # visualize BIC of fitted models
##D plot(car.lst)
##D 
##D # print overview of fitmeasures for all fitted models
##D car.lst
## End(Not run)



