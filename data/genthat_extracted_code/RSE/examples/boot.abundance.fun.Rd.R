library(RSE)


### Name: boot.abundance.fun
### Title: Generate a bootstrap abundance-based sample
### Aliases: boot.abundance.fun

### ** Examples

## As an example, Herpetological assemblage data are used here.		
data(HerpetologicalData)
## two columns represent two samples of species abundance data
X.merge = HerpetologicalData
## the first column is treated as the original sample
Xi = X.merge[,1]
## Convert species abundance data to species frequency counts data
f = X.to.f(Xi)
b = DetAbu(x=Xi, zero=FALSE)		
## the estimated number of species 
S.hat = SpEst.Chao1.abun(f)	
boot.abundance.fun(S.hat=S.hat, f=f, b=b)



