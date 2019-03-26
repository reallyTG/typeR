library(pscl)


### Name: constrain.items
### Title: constrain item parameters in analysis of roll call data
### Aliases: constrain.items
### Keywords: datagen

### ** Examples

## Not run: 
##D data(s109)
##D f <- system.file("extdata","id1.rda",package="pscl")
##D load(f)
##D id1sum <- summary(id1,include.beta=TRUE)
##D suspect1 <- id1sum$bSig[[1]]=="95##D 
##D close60 <- id1sum$bResults[[1]][,"Yea"] < 60
##D close40 <- id1sum$bResults[[1]][,"Yea"] > 40
##D suspect <- suspect1 & close60 & close40
##D id1sum$bResults[[1]][suspect,]
##D suspectVotes <- dimnames(id1sum$bResults[[1]][suspect,])[[1]]
##D 
##D 
##D ## constraints on 2d model,
##D ## close rollcall poorly fit by 1d model
##D ## serves as reference item for 2nd dimension
##D 
##D cl <- constrain.items(s109,
##D                       x=list("2-150"=c(0,7),
##D                         "2-169"=c(7,0)),
##D                       d=2)
##D 
##D id1Constrained <- ideal(s109,
##D                         d=2,
##D                         meanzero=TRUE,
##D                         priors=cl,
##D                         startvals=cl,
##D                         maxiter=1e5,
##D                         burnin=1e3,
##D                         thin=1e2)
##D summary(id1Constrained,include.beta=TRUE)
## End(Not run)



