library(FastRCS)


### Name: Lemons
### Title: Sales Data for the Chrysler Town & Country
### Aliases: Lemons
### Keywords: datasets

### ** Examples

data(Lemons)
alpha<-0.5
p<-ncol(Lemons)
ns<-FRCSnumStarts(p=p,eps=(1-alpha)*4/5)
Fit<-FastRCS(x=Lemons[,-1],y=Lemons[,1],nSamp=ns,seed=1)
plot(Fit)



