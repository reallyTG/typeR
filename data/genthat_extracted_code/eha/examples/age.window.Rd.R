library(eha)


### Name: age.window
### Title: Age cut of survival data
### Aliases: age.window
### Keywords: survival

### ** Examples


dat <- data.frame(enter = 0, exit = 5.731, event = 1, x = 2)
window <- c(2, 5.3)
dat.trim <- age.window(dat, window)  




