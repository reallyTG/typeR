library(pscl)


### Name: summary.ideal
### Title: summary of an ideal object
### Aliases: summary.ideal
### Keywords: classes

### ** Examples

f <- system.file("extdata","id1.rda",package="pscl")
load(f)
summary(id1)

## Not run: 
##D data(s109)
##D cl2 <- constrain.legis(s109,
##D                        x=list("KENNEDY (D MA)"=c(-1,0),
##D                          "ENZI (R WY)"=c(1,0),
##D                          "CHAFEE (R RI)"=c(0,-.5)),
##D                        d=2)
##D id2Constrained <- ideal(s109,
##D                         d=2,
##D                         priors=cl2,      ## priors (w constraints)
##D                         startvals=cl2,   ## start value (w constraints)
##D                         store.item=TRUE,
##D                         maxiter=5000,
##D                         burnin=500,
##D                         thin=25)
##D 
##D summary(id2Constrained,
##D         include.items=TRUE)
## End(Not run)



