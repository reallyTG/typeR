library(agricolae)


### Name: bar.err
### Title: Plotting the standard error or standard deviance of a multiple
###   comparison of means
### Aliases: bar.err
### Keywords: aplot

### ** Examples

library(agricolae)
data(sweetpotato)
model<-aov(yield~virus,data=sweetpotato)
out <- waller.test(model,"virus", console=TRUE,
main="Yield of sweetpotato\ndealt with different virus")
par(mfrow=c(2,2),cex=1)
bar.err(out$means,variation="range",horiz=TRUE,xlim=c(0,45),angle=125,density=6,
 main="range")
bar.err(out$means,variation="SD",ylim=c(0,45),col=colors()[30],
 main="Standard deviation",density=8)
bar.err(out$means,variation="SE",horiz=TRUE,xlim=c(0,45),density=8,
 col="brown",main="Standard error")
bar.err(out$means,variation="range",ylim=c(0,45),bar=FALSE,col="green",
 main="range")
par(mfrow=c(1,2),cex=1)
bar.err(out$means,variation="range",ylim=c(0,45),bar=FALSE,col=0)
abline(h=0)
# horiz = TRUE
bar.err(out$means,variation="SE",horiz=TRUE,xlim=c(0,45),bar=FALSE,col=0)
#startgraph
par(mfrow=c(1,1))
#endgraph



