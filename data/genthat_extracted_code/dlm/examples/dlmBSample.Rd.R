library(dlm)


### Name: dlmBSample
### Title: Draw from the posterior distribution of the state vectors
### Aliases: dlmBSample
### Keywords: misc

### ** Examples

nileMod <- dlmModPoly(1, dV = 15099.8, dW = 1468.4)
nileFilt <- dlmFilter(Nile, nileMod)
nileSmooth <- dlmSmooth(nileFilt) # estimated "true" level
plot(cbind(Nile, nileSmooth$s[-1]), plot.type = "s",
     col = c("black", "red"), ylab = "Level",
     main = "Nile river", lwd = c(2, 2)) 
for (i in 1:10) # 10 simulated "true" levels 
    lines(dlmBSample(nileFilt[-1]), lty=2) 



