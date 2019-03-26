library(plfm)


### Name: plot.stepplfm
### Title: Plot fit of 'stepplfm' objects
### Aliases: plot.stepplfm

### ** Examples


## Not run: 
##D ## example 1:Perceptual analysis of associations between car models and car attributes
##D 
##D ##load car data
##D data(car)
##D 
##D 
##D ## compute 5 runs of disjunctive and conjunctive models with 1 up to 4 features
##D car.lst<-stepplfm(minF=1,maxF=4,maprule="disj/conj",freq1=car$freq1,
##D                   freqtot=car$freqtot,M=5)
##D 
##D ## visualize the fit of models with different mapping rules 
##D ## and a different number of features
##D 
##D par(pty="s")
##D par(mfrow=c(2,2))
##D plot(car.lst,which="BIC")
##D plot(car.lst,which="AIC")
##D plot(car.lst,which="VAF")
##D 
## End(Not run)

## Not run: 
##D ## example 2: analysis on determinants of anger-related behavior
##D 
##D ## load anger data
##D data(anger)
##D 
##D ## compute 1 run of disjunctive and conjunctive models with 1 up to 3 features
##D anger.lst<-stepplfm(minF=1,maxF=3,maprule="disj/conj",freq1=anger$freq1,
##D                     freqtot=anger$freqtot,M=1)
##D 
##D ## visualize the fit of models with different mapping rules 
##D ## and a different number of features
##D 
##D par(pty="s")
##D par(mfrow=c(2,2))
##D plot(anger.lst,which="BIC")
##D plot(anger.lst,which="AIC")
##D plot(anger.lst,which="VAF")
## End(Not run)




