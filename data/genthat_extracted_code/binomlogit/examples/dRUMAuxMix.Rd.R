library(binomlogit)


### Name: dRUMAuxMix
### Title: Auxiliary mixture sampling for the binomial logit model
### Aliases: dRUMAuxMix
### Keywords: regression

### ** Examples

## Auxiliary mixture sampling in the aggregated dRUM representation of a
## binomial logit model

## load caesarean birth data
data(caesarean)
yi <- as.numeric(caesarean[,1])                          
Ni <- as.numeric(caesarean[,2])                           
X <- as.matrix(caesarean[,-(1:2)])

## start auxiliary mixture sampler
aux1=dRUMAuxMix(yi,Ni,X,verbose=0)
## Not run: 
##D aux2=dRUMAuxMix(yi,Ni,X)
## End(Not run)

print(aux1)
summary(aux1)
plot(aux1)

## Not run: 
##D ## Auxiliary mixture sampling in the individual dRUM representation of a
##D ## binomial logit model
##D 
##D ## load caesarean birth data
##D data(caesarean_aux)
##D yi <- as.numeric(caesarean_aux[,1])                          
##D Ni <- as.numeric(caesarean_aux[,2])                           
##D X <- as.matrix(caesarean_aux[,-(1:2)])
##D 
##D ## start auxiliary mixture sampler
##D aux3=dRUMAuxMix(yi,Ni,X)
##D 
##D print(aux3)
##D summary(aux3)
##D plot(aux3)
## End(Not run)



