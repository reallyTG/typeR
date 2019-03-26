library(BAS)


### Name: update.bas
### Title: Update BAS object using a new prior
### Aliases: update.bas update
### Keywords: regression

### ** Examples


## Not run: 
##D library(MASS)
##D data(UScrime)
##D UScrime[,-2] <- log(UScrime[,-2])
##D crime.bic <-  bas.lm(y ~ ., data=UScrime, n.models=2^15, prior="BIC",initprobs= "eplogp")
##D crime.ebg <- update(crime.bic, newprior="EB-global")
##D crime.zs <- update(crime.bic, newprior="ZS-null")
## End(Not run)




