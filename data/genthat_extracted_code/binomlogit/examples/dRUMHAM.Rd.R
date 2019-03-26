library(binomlogit)


### Name: dRUMHAM
### Title: Hybrid auxiliary mixture sampling for the binomial logit model
### Aliases: dRUMHAM
### Keywords: regression

### ** Examples

## Hybrid auxiliary mixture sampling in the aggregated dRUM representation  
## of a binomial logit model

## load caesarean birth data
data(caesarean)
yi <- as.numeric(caesarean[,1])                          
Ni <- as.numeric(caesarean[,2])                           
X <- as.matrix(caesarean[,-(1:2)])

## start HAM sampler
ham1 <- dRUMHAM(yi,Ni,X)
## Not run: 
##D ham2 <- dRUMHAM(yi,Ni,X,low=0.01,up=0.99)
## End(Not run)

print(ham1)
summary(ham1)
plot(ham1)



