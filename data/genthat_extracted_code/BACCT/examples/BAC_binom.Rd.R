library(BACCT)


### Name: BAC_binom
### Title: Bayesian Augmented Control for Binary Responses
### Aliases: BAC_binom

### ** Examples

## Not run: 
##D library(BACCT)
##D #borrow from 3 historical trials#
##D yh = c(11,300,52);nh = c(45,877,128)
##D #specify current trial sample sizes#
##D n1 = 20;n2 = 30
##D 
##D #Difference criterion type in full simulation mode#
##D obj1 = BAC_binom(yh=yh,nh=nh,n1=n1,n2=n2,n.chain=5,
##D criterion.type="diff",sim.mode="full")
##D 
##D #Probability criterion type in express simulation mode#
##D obj2 = BAC_binom(yh=yh,nh=nh,n1=n1,n2=n2,n.chain=5,
##D criterion.type="prob",prob.threshold=0.1,sim.mode="express")
##D 
##D #S3 method for class "BAC"
##D summary(obj1)
## End(Not run)



