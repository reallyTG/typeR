library(caroline)


### Name: raPlot
### Title: Generate a Ratio Average [RAy] Plot.
### Aliases: raPlot

### ** Examples


a <- rnbinom(n=10000, mu=5, size=2)
b <- rnbinom(n=10000, mu=5, size=2)

## the alternative 
plot(a,b)
## the raPlot version
raPlot(a, b) 

## highlight the condition unique points in the same way as  edgeR's "maPlot"
RA <- raPlot(a, b, pch='')
cond.unique <- apply(cbind(a,b), 1, function(d) any(d==0))
points(RA$A,RA$R, col=c('black','orange')[cond.unique+1])

## try playing with jittering over plotted points
raPlot(a, b, jitter=.3)




