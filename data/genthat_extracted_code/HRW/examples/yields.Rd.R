library(HRW)


### Name: yields
### Title: U.S., European and Japanese yield curves
### Aliases: yields

### ** Examples

library(HRW) ; data(yields)
t <- 1:30 ; yieldsCleaned <- na.omit(yields)[,-1]
plot(t,yieldsCleaned[1,61:90], type="l",ylim = c(0,6),lwd = 2,
     xlab = "maturity (years)",ylab = "yield",
     bty = "l",cex.lab = 1.5,cex.axis = 1.5)
for (i in 2:14) lines(t,yieldsCleaned[100*i+1,61:90],col = i,lwd = 2)



