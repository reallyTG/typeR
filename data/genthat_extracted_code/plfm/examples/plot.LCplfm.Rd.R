library(plfm)


### Name: plot.LCplfm
### Title: plot parameters in 'LCplfm' object
### Aliases: plot.LCplfm

### ** Examples


## Not run: 
##D # example 1: analysis on determinants of anger-related behavior
##D 
##D # load anger data
##D data(anger)
##D 
##D # compute 5 runs of disjunctive latent class probabilistic feature model
##D # with 4 features and 2 latent classes
##D # assume constant situation classification per person 
##D # and class-specific situation parameters (i.e. model=1) 
##D 
##D anger.m1<-LCplfm(data=anger$data,F=4,T=2,maprule="disj",
##D                   M=5,emcrit1=1e-3,emcrit2=1e-8,model=1)
##D 
##D # visualize object and attribute parameters 
##D # of both classes per feature in one figure
##D 
##D par(mfrow=c(2,2),pty="s")
##D plot(anger.m1,element="attribute",feature=1, main="Feature 1", 
##D      minpositionlabel=-2, positionlabel=-1)
##D plot(anger.m1,element="attribute",feature=2, main="Feature 2", 
##D      minpositionlabel=-2, positionlabel=-1)
##D plot(anger.m1,element="attribute",feature=3, main="Feature 3", 
##D      minpositionlabel=-2, positionlabel=-1)
##D plot(anger.m1,element="attribute",feature=4, main="Feature 4", 
##D      minpositionlabel=-2, positionlabel=-1)
##D 
##D par(mfrow=c(2,2),pty="s")
##D plot(anger.m1,element="object",feature=1,main="Feature 1", 
##D      minpositionlabel=-1.5, positionlabel=-1, y.intersplegend=0.7)
##D plot(anger.m1,element="object",feature=2,main="Feature 2", 
##D      minpositionlabel=-1.5, positionlabel=-1, y.intersplegend=0.7)
##D plot(anger.m1,element="object",feature=3,main="Feature 3", 
##D      minpositionlabel=-1.5, positionlabel=-1, y.intersplegend=0.7)
##D plot(anger.m1,element="object",feature=4,main="Feature 4", 
##D      minpositionlabel=-1.5, positionlabel=-1, y.intersplegend=0.7)
##D 
##D # compute 5 runs of disjunctive latent class probabilistic feature model
##D # with 2 features and 2 latent classes
##D # assume constant situation classification per person 
##D # and class-specific situation and behavior parameters (i.e. model=3) 
##D 
##D anger.m3<-LCplfm(data=anger$data,F=2,T=2,maprule="disj",
##D                   M=5,emcrit1=1e-3,emcrit2=1e-8,model=3)
##D 
##D # visualize object and attribute parameters of feature 1,2 
##D # for class 1
##D par(mfrow=c(2,2)) 
##D plot(anger.m3,element="attribute",feature=1, class=1,main="Feature 1, class 1", 
##D      minpositionlabel=-2, positionlabel=-1)
##D plot(anger.m3,element="attribute",feature=2, class=1,main="Feature 2, class 1", 
##D      minpositionlabel=-2, positionlabel=-1)
##D plot(anger.m3,element="object",feature=1, class=1,main="Feature 1, class 1", 
##D      minpositionlabel=-2, positionlabel=-1)
##D plot(anger.m3,element="object",feature=2, class=1,main="Feature 2, class 1", 
##D      minpositionlabel=-2, positionlabel=-1)
##D 
##D 
##D # visualize object and attribute parameters of feature 1,2 
##D # for class 2
##D par(mfrow=c(2,2))
##D plot(anger.m3,element="attribute",feature=1, class=2,main="Feature 1, class 2", 
##D      minpositionlabel=-1.7, positionlabel=-1, y.intersplegend=0.7)
##D plot(anger.m3,element="attribute",feature=2, class=2,main="Feature 2, class 2", 
##D      minpositionlabel=-1.7, positionlabel=-1, y.intersplegend=0.7)
##D plot(anger.m3,element="object",feature=1, class=2,main="Feature 1, class 2", 
##D      minpositionlabel=-1.7, positionlabel=-1, y.intersplegend=0.7)
##D plot(anger.m3,element="object",feature=2, class=2,main="Feature 2, class 2", 
##D      minpositionlabel=-1.7, positionlabel=-1, y.intersplegend=0.7)
##D 
## End(Not run)



