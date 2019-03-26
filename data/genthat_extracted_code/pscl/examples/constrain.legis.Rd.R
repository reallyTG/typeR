library(pscl)


### Name: constrain.legis
### Title: constrain legislators' ideal points in analysis of roll call
###   data
### Aliases: constrain.legis
### Keywords: datagen

### ** Examples

data(s109)
cl <- constrain.legis(s109,
                      x=list("KENNEDY"=-1,
                        "ENZI"=1),
                      d=1)

## Not run: 
##D ## too long for examples
##D id1Constrained <- ideal(s109,
##D                        d=1,
##D                        priors=cl,      ## use cl
##D                        startvals=cl,   ## use cl
##D                        maxiter=5000,
##D                        burnin=500,
##D                        thin=25)
##D summary(id1Constrained)
##D 
##D cl2 <- constrain.legis(s109,
##D                        x=list("KENNEDY"=c(-1,0),
##D                          "ENZI"=c(1,0),
##D                          "CHAFEE"=c(0,-.5)),
##D                        d=2)
##D 
##D 
##D id2Constrained <- ideal(s109,
##D                         d=2,
##D                         priors=cl2,      ## priors (w constraints)
##D                         startvals=cl2,   ## start value (w constraints)
##D                         store.item=TRUE,
##D                         maxiter=5000,
##D                         burnin=500,
##D                         thin=25)
##D summary(id2Constrained,include.items=TRUE)
## End(Not run)



