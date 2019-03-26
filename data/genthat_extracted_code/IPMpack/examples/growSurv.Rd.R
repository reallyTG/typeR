library(IPMpack)


### Name: growSurv
### Title: Combines growth and survival.
### Aliases: growSurv

### ** Examples

dff <- generateData()
gr1 <- makeGrowthObj(dff)
sv1 <- makeSurvObj(dff)
sizeRange <- c(1:20)
sizeInit <- 1
growSurv(sizeInit, sizeRange, data.frame(covariate=1), gr1, sv1)
plot(growSurv(sizeInit, sizeRange, data.frame(covariate=1), gr1, sv1), 
    type="l", col = "dark gray", 
	xlab = "Continuous (e.g. size) stage at time t+1", 
	ylab = paste("Probability of survival to a specific size in t+1 from size ", 
			sizeInit, " at time t"))



