library(binomlogit)


### Name: IndivdRUMIndMH
### Title: Data-augmented independence Metropolis-Hastings sampling for the
###   binary logit model
### Aliases: IndivdRUMIndMH
### Keywords: regression

### ** Examples

## Data-augmented independence Metropolis-Hastings sampling for the
## binary logit model

## load caesarean birth data
data(caesarean_binary)
y <- as.numeric(caesarean_binary[,1])                                                 
X <- as.matrix(caesarean_binary[,-1])

## start independence MH sampler
indivMH1 <- IndivdRUMIndMH(y,X)

print(indivMH1)
summary(indivMH1)
plot(indivMH1)

## Not run: 
##D ## load simulated data set
##D data(simul_binary)
##D y <- as.numeric(simul_binary[,1])                                           
##D X <- as.matrix(simul_binary[,-1])
##D 
##D ## use a small acc>0 (e.g. acc=50), otherwise the sampler gets stuck at
##D ## the starting values
##D indivMH2 <- IndivdRUMIndMH(y,X,acc=50)
##D 
##D print(indivMH2)
##D summary(indivMH2)
##D plot(indivMH2)
## End(Not run)



