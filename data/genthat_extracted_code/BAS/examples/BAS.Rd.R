library(BAS)


### Name: BAS
### Title: BAS: Bayesian Model Averaging using Bayesian Adaptive Sampling
### Aliases: BAS BAS-package
### Keywords: package regression

### ** Examples

data("Hald")
hald.gprior =  bas.lm(Y ~ ., data=Hald, alpha=13, prior="g-prior")

# more complete demos

demo(BAS.hald)
## Not run: 
##D demo(BAS.USCrime)
## End(Not run)



