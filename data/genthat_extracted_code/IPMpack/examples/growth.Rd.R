library(IPMpack)


### Name: growth
### Title: Estimates growth probabilities.
### Aliases: growth

### ** Examples

dff <- generateData()
gr1 <- makeGrowthObj(dff)
sizeRange <- c(1:20)
sizeInit <- 1
growth(sizeInit, sizeRange, data.frame(cov=1), gr1)
plot(growth(sizeInit, sizeRange, data.frame(cov=1), gr1), type="l", 
	col = "dark gray", xlab = "Continuous (e.g. size) stage at time t+1", 
	ylab = paste("Probability of growth to a specific size in t+1 from size ", 
			sizeInit, " at time t"))



