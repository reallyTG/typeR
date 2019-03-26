library(plfm)


### Name: stepplfm
### Title: Probabilistic latent feature analysis of two-way two-mode
###   frequency data
### Aliases: stepplfm

### ** Examples



## Not run: 
##D # example 1:Perceptual analysis of associations between car models and car attributes
##D 
##D # load car data
##D data(car)
##D 
##D 
##D # compute 5 runs of disjunctive and conjunctive models with 1 up to 4 features
##D car.lst<-stepplfm(minF=1,maxF=4,maprule="disj/conj",freq1=car$freq1,
##D                   freqtot=car$freqtot,M=5,emcrit1=1e-6)
##D 
##D # print output of the conjunctive model with 4 features
##D car.lst$conj[[4]]
##D 
##D # print output of the stepplfm analysis on the car data
##D car.lst
##D 
##D # summarize and print output of stepplfm analysis on car data
##D sumcar<-summary(car.lst)
##D sumcar
##D 
##D # visualize fit of models with different mapping rules and a different number of features
##D par(pty="s")
##D par(mfrow=c(2,2))
##D plot(car.lst,which="BIC")
##D plot(car.lst,which="AIC")
##D plot(car.lst,which="VAF")
## End(Not run)


## Not run: 
##D # example 2: analysis on determinants of anger-related behavior
##D 
##D # load anger data
##D data(anger)
##D 
##D # compute 1 run of disjunctive models with 1 up to 3 features
##D anger.lst<-stepplfm(minF=1,maxF=3,maprule="disj",freq1=anger$freq1,freqtot=anger$freqtot,M=1)
##D 
##D # print output of disjunctive model with 2 features
##D 
##D anger.lst[[2]]
##D 
##D # print output of stepplfm analysis on anger data
##D anger.lst
##D 
##D # summarize and print output of stepplfm analysis on anger data
##D sumanger<-summary(anger.lst)
##D sumanger
##D 
##D # visualize fit of models with different mapping rules and a different number of features
##D 
##D par(pty="s")
##D par(mfrow=c(2,2))
##D plot(anger.lst,which="BIC")
##D plot(anger.lst,which="AIC")
##D plot(anger.lst,which="VAF")
## End(Not run)



