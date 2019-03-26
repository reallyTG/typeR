library(submax)


### Name: score
### Title: Creates M-scores for Use by submax().
### Aliases: score
### Keywords: htest robust

### ** Examples

data(mercury)
attach(mercury)
# The mercury data has two binary covariates, black and female,
# that will be considered as potential effect modifiers.
# Both black and female are not exactly matched.  Of 397
# matched sets, 72 contain three blacks, 319 contain no
# blacks, 3 contain one black, and 3 contain 2 blacks.
table(table(mset,black)[,2])
# A similar situation arises with females.
table(table(mset,female)[,2])
# When considering females as an effect modifier, only
# sets exactly matched for female are used, etc.  A
# set that is inexact for black may be used when looking
# at females, providing that set is exactly matched for female.


male<-1-female
nonblack<-1-black
everyone<-rep(1,dim(mercury)[1])
x<-cbind(everyone,female,male,black,nonblack)
sc<-score(methylmercury,fish,mset,x)

# At gamma=4, the global null of no effect is
# rejected at alpha=0.05 by every subgroup test
submax(sc$y,sc$cmat,gamma=4,fast=TRUE)

# What does expandx do?
sc<-score(methylmercury,fish,mset,cbind(female,black))
head(sc$cmat)
sc<-score(methylmercury,fish,mset,cbind(female,black),expandx=TRUE)
head(sc$cmat)

# Using exandx with a vector: remember to give it a name.
sc<-score(methylmercury,fish,mset,female,xnames="Female",expandx=TRUE)
head(sc$cmat)

 ## Not run: 
##D # For closed testing, the process is repeated with fewer columns.
##D # In general, if cmat has L columns, closed testing may require
##D # up to (2^L)-1 tests.  Here are two of those tests.
##D   sc<-score(methylmercury,fish,mset,cbind(female,black))
##D   submax(sc$y,sc$cmat,gamma=4)
##D # Note that the critical.constant has become smaller, making it
##D # easier to reject a component hypothesis when fewer hypotheses
##D # are tested.
##D   sc<-score(methylmercury,fish,mset,female,xnames="Female")
##D   submax(sc$y,sc$cmat,gamma=4,fast=TRUE)
##D # Use of closed testing is discussed in Lee et al. (2017).
##D 
##D # For a two-sided test, change alpha and do 2 tests.
##D   submax(sc$y,sc$cmat,gamma=4,alpha=0.025,alternative = "greater")
##D   submax(sc$y,sc$cmat,gamma=4,alpha=0.025,alternative = "less")
##D # So we reject in the positive direction in all 5 component tests.
##D   
## End(Not run)
detach(mercury)



