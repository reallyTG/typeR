library(CPsurv)


### Name: plot.cpsurv
### Title: Plot method for objects of class cpsurv
### Aliases: plot.cpsurv

### ** Examples

data(survdata)
cp <- cpsurv(survdata$time, survdata$event, cpmax = 360, intwd = 10)
plot(cp, ask = FALSE)

## Not run: 
##D cp <- cpsurv(survdata$time, survdata$event, cpmax = 360, intwd = 10,
##D boot.ci = TRUE)
##D plot(cp, type = "pvals", ask = FALSE)
## End(Not run)



