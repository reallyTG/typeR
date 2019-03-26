library(BigVAR)


### Name: BigVAR
### Title: Dimension Reduction Methods for Multivariate Time Series.
### Aliases: BigVAR BigVAR-package

### ** Examples

# Fit a Basic VAR-L(3,4) on simulated data
data(Y)
T1=floor(nrow(Y)/3)
T2=floor(2*nrow(Y)/3)
m1=constructModel(Y,p=4,struct="Basic",gran=c(50,10),verbose=FALSE,T1=T1,T2=T2,IC=FALSE)
plot(m1)
results=cv.BigVAR(m1)
plot(results)
predict(results,n.ahead=1)



