library(fDMA)


### Name: trends
### Title: Google Trends for Crude Oil Data.
### Aliases: trends

### ** Examples

data(trends)
gtrends <- trends/100
data(crudeoil)
wti <- crudeoil[-1,1]
drivers <- (lag(crudeoil[,-1],k=1))[-1,]
ld.wti <- (diff(log(wti)))[-1,]
ld.drivers <- (diff(log(drivers)))[-1,]
ld.wti <- ld.wti['2004-01-01-/']
ld.drivers <- ld.drivers['2004-01-01-/']
## Not run: 
##D xx <- ld.drivers
##D m <- fDMA(y=ld.wti,x=xx,alpha=0.99,lambda=0.99,initvar=1,model="dma",gprob=gtrends,omega=0.5)
## End(Not run)



