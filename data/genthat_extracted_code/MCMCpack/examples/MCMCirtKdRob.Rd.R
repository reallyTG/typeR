library(MCMCpack)


### Name: MCMCirtKdRob
### Title: Markov Chain Monte Carlo for Robust K-Dimensional Item Response
###   Theory Model
### Aliases: MCMCirtKdRob
### Keywords: models

### ** Examples


   ## Not run: 
##D    ## Court example with ability (ideal point) and
##D    ##  item (case) constraints
##D    data(SupremeCourt)
##D    post1 <- MCMCirtKdRob(t(SupremeCourt), dimensions=1,
##D                    burnin=500, mcmc=5000, thin=1,
##D                    B0=.25, store.item=TRUE, store.ability=TRUE,
##D                    ability.constraints=list("Thomas"=list(1,"+"),
##D                    "Stevens"=list(1,-4)),
##D                    item.constraints=list("1"=list(2,"-")),
##D                    verbose=50)
##D    plot(post1)
##D    summary(post1)
##D 
##D    ## Senate example with ability (ideal point) constraints
##D    data(Senate)
##D    namestring <- as.character(Senate$member)
##D    namestring[78] <- "CHAFEE1"
##D    namestring[79] <- "CHAFEE2"
##D    namestring[59] <- "SMITH.NH"
##D    namestring[74] <- "SMITH.OR"
##D    rownames(Senate) <- namestring
##D    post2 <- MCMCirtKdRob(Senate[,6:677], dimensions=1,
##D                          burnin=1000, mcmc=5000, thin=1,
##D                          ability.constraints=list("KENNEDY"=list(1,-4),
##D                                   "HELMS"=list(1, 4), "ASHCROFT"=list(1,"+"),
##D                                   "BOXER"=list(1,"-"), "KERRY"=list(1,"-"),
##D                                   "HATCH"=list(1,"+")),
##D                          B0=0.1, store.ability=TRUE, store.item=FALSE,
##D                          verbose=5, k0=0.15, k1=0.15,
##D                          delta0.start=0.13, delta1.start=0.13)
##D 
##D    plot(post2)
##D    summary(post2)
##D    
## End(Not run)




