library(binomlogit)


### Name: dRUMIndMH
### Title: Data-augmented independence Metropolis-Hastings sampling for the
###   binomial logit model
### Aliases: dRUMIndMH print.binomlogit summary.binomlogit plot.binomlogit
### Keywords: regression

### ** Examples

## Independence MH sampling in the aggregated dRUM representation of a 
## binomial logit model

## load caesarean birth data
data(caesarean)
yi <- as.numeric(caesarean[,1])                          
Ni <- as.numeric(caesarean[,2])                           
X <- as.matrix(caesarean[,-(1:2)])

## start independence MH sampler
mh1 <- dRUMIndMH(yi,Ni,X)

print(mh1)
summary(mh1)
plot(mh1)

## Not run: 
##D ## load simulated data set
##D data(simul)
##D yi <- as.numeric(simul[,1])                          
##D Ni <- as.numeric(simul[,2])                           
##D X <- as.matrix(simul[,-(1:2)])
##D 
##D ## use a small acc>0 (e.g. acc=50), otherwise the sampler gets stuck at
##D ## the starting values
##D mh2 <- dRUMIndMH(yi,Ni,X,acc=50)
##D 
##D print(mh2)
##D summary(mh2)
##D plot(mh2)
## End(Not run)



