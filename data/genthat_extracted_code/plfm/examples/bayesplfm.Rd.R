library(plfm)


### Name: bayesplfm
### Title: Bayesian analysis of probabilistic latent feature models for
###   two-way two-mode frequency data
### Aliases: bayesplfm

### ** Examples


## Not run: 
##D ## example 1: Bayesian analysis using data generated under the model
##D 
##D ## define number of objects
##D J<-10
##D ## define number of attributes
##D K<-10
##D ## define number of features
##D F<-2
##D 
##D ## generate true parameters
##D set.seed(43565)
##D objectparameters<-matrix(runif(J*F),nrow=J)
##D attributeparameters<-matrix(runif(K*F),nrow=K)
##D 
##D ## generate data for conjunctive model using N=100 replications
##D gdat<-gendat(maprule="conj",N=100,
##D               objpar=objectparameters,attpar=attributeparameters)
##D 
##D ## Use stepplfm to compute posterior mode(s) for 1 up to 3 features 
##D 
##D conj.lst<-stepplfm(minF=1,maxF=3,maprule="conj",freq1=gdat$freq1,freqtot=100,M=5)
##D 
##D 
##D ## Compute a sample of the posterior distribution 
##D ## for the conjunctive model with two features
##D ## use the posterior mode obtained with stepplfm as starting point
##D conjbayes2<-bayesplfm(maprule="conj",freq1=gdat$freq1,freqtot=100,F=2,
##D                       maxNiter=3000,Nburnin=0,Nstep=1000,Nchains=2,
##D                       start.bayes="fitted.plfm",fitted.plfm=conj.lst[[2]])
##D 
## End(Not run)

## Not run: 
##D ## example 2: Bayesian analysis of situational determinants of anger-related behavior
##D 
##D ## load data
##D data(anger)
##D 
##D ## Compute one chain of 500 iterations (including 250 burn-in iterations) 
##D ## for the disjunctive model with two features
##D ## use a random starting point
##D 
##D bayesangerdisj2a<-bayesplfm(maprule="disj",freq1=anger$freq1,freqtot=anger$freqtot,F=2,
##D                       maxNiter=500,Nstep=500,Nburnin=250,Nchains=1,start.bayes="random")
##D 
##D ##print a summary of the output 
##D summary(bayesangerdisj2a)
##D 
##D 
##D ## Compute a sample of the posterior distribution 
##D ## for the disjunctive model with two features
##D ## compute starting points with plfm
##D ## run 2 chains with a maximum length of 10000 iterations
##D ## compute convergence after each 1000 iterations
##D 
##D bayesangerdisj2b<-bayesplfm(maprule="disj",freq1=anger$freq1,freqtot=anger$freqtot,F=2,
##D                       maxNiter=10000,Nburnin=0,Nstep=1000,Nchains=2,start.bayes="best")
##D 
##D 
##D ## print the output of the disjunctive 2-feature model for the anger data
##D print(bayesangerdisj2b)
##D 
##D 
##D ## print a summary of the output of the disjunctive 2-feature model 
##D ##for the anger data
##D summary(bayesangerdisj2b)
## End(Not run)





