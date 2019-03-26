library(extraDistr)


### Name: Rayleigh
### Title: Rayleigh distribution
### Aliases: Rayleigh drayleigh prayleigh qrayleigh rrayleigh
### Keywords: distribution

### ** Examples


x <- rrayleigh(1e5, 13)
hist(x, 100, freq = FALSE)
curve(drayleigh(x, 13), 0, 60, col = "red", add = TRUE)
hist(prayleigh(x, 13)) 
plot(ecdf(x))
curve(prayleigh(x, 13), 0, 60, col = "red", lwd = 2, add = TRUE) 




