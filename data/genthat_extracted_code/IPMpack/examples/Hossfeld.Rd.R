library(IPMpack)


### Name: Hossfeld
### Title: Creates a Hossfeld function defining growth.
### Aliases: Hossfeld

### ** Examples

dff <- generateData()
sizeRange <- c(1:20)
sizeInit <- 1
Hossfeld(sizeRange, rep(1, 3))
plot(Hossfeld(1:10, rep(1, 3)), type = "l", 
    ylab = "Predicted increment from t to t+1", 
	xlab = "Continuous (size) stage in time t", col = "dark gray")



