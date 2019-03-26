library(IPMpack)


### Name: growthCum
### Title: Models growth allowing for cumulative bin estimation.
### Aliases: growthCum

### ** Examples

dff <- generateData()
gr1 <- makeGrowthObj(dff)
sizeRange <- c(1:20)
sizeInit <- 1
growthCum(sizeInit, sizeRange, data.frame(cov=1), gr1)
plot(growthCum(sizeInit, sizeRange, data.frame(cov=1), gr1), type="l", 
	col = "dark gray", xlab = "Continuous (e.g. size) stage at time t+1", 
		ylab = paste("Cummulative growth to a specific size in t+1 from size ", 
			sizeInit, " at time t"))



