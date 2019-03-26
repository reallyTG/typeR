library(YieldCurve)


### Name: NSrates
### Title: Interest rates of the Nelson-Siegel's model.
### Aliases: NSrates

### ** Examples
 
data(FedYieldCurve)
maturity.Fed <- c(3/12, 0.5, 1,2,3,5,7,10)
NSParameters <- Nelson.Siegel( rate = first(FedYieldCurve,'10 month'), maturity=maturity.Fed )
y <- NSrates(NSParameters[5,],maturity.Fed)
plot(maturity.Fed,FedYieldCurve[10,],main="Fitting Nelson-Siegel yield curve", type="o")
lines(maturity.Fed,y, col=2)
legend("topleft",legend=c("observed yield curve","fitted yield curve"),
col=c(1,2),lty=1)
grid()



