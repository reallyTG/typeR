library(pscl)


### Name: postProcess
### Title: remap MCMC output via affine transformations
### Aliases: postProcess
### Keywords: models

### ** Examples

data(s109)
f = system.file("extdata",package="pscl","id1.rda")
load(f)

id1Local <- postProcess(id1)    ## default is to normalize
summary(id1Local)

id1pp <- postProcess(id1,
                     constraints=list(BOXER=-1,INHOFE=1))
summary(id1pp)

## two-dimensional fit
f = system.file("extdata",package="pscl","id2.rda")
load(f)

id2pp <- postProcess(id2,
                     constraints=list(BOXER=c(-1,0),
                       INHOFE=c(1,0),
                       CHAFEE=c(0,.25)))

tracex(id2pp,d=1:2,
       legis=c("BOXER","INHOFE","COLLINS","FEINGOLD","COLEMAN",
         "CHAFEE","MCCAIN","KYL"))



