library(eha)


### Name: cal.window
### Title: Calendar time cut of survival data
### Aliases: cal.window
### Keywords: survival

### ** Examples


dat <- data.frame(enter = 0, exit = 5.731, event = 1,
birthdate = 1962.505, x = 2)
window <- c(1963, 1965)
dat.trim <- cal.window(dat, window)  




