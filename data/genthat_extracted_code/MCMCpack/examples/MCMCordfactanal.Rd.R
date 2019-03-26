library(MCMCpack)


### Name: MCMCordfactanal
### Title: Markov Chain Monte Carlo for Ordinal Data Factor Analysis Model
### Aliases: MCMCordfactanal
### Keywords: models

### ** Examples


   ## Not run: 
##D    data(painters)
##D    new.painters <- painters[,1:4]
##D    cuts <- apply(new.painters, 2, quantile, c(.25, .50, .75))
##D    for (i in 1:4){
##D       new.painters[new.painters[,i]<cuts[1,i],i] <- 100
##D      new.painters[new.painters[,i]<cuts[2,i],i] <- 200
##D      new.painters[new.painters[,i]<cuts[3,i],i] <- 300
##D      new.painters[new.painters[,i]<100,i] <- 400
##D    }
##D 
##D    posterior <- MCMCordfactanal(~Composition+Drawing+Colour+Expression,
##D                         data=new.painters, factors=1,
##D                         lambda.constraints=list(Drawing=list(2,"+")),
##D                         burnin=5000, mcmc=500000, thin=200, verbose=500,
##D                         L0=0.5, store.lambda=TRUE,
##D                         store.scores=TRUE, tune=1.2)
##D    plot(posterior)
##D    summary(posterior)
##D    
## End(Not run)




