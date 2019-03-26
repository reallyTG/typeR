library(nlr)


### Name: nl.lts
### Title: Compute (LTS) Least Trimmed Square Estimate.
### Aliases: nl.lts
### Keywords: Least Square Estimae Least Trimmed Square

### ** Examples

data=list(xr=Weights$Date,yr=Weights$Weight)
fit<- nl.lts(nlrobj1[[14]],data=data,start=list(p1=1000,p2=42,p3=.11))
fit$parameters



