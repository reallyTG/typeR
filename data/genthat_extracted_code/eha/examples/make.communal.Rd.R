library(eha)


### Name: make.communal
### Title: Put communals in "fixed" data frame
### Aliases: make.communal
### Keywords: survival

### ** Examples


dat <- data.frame(enter = 0, exit = 5.731, event = 1,
birthdate = 1962.505, x = 2)
## Birth date: July 2, 1962 (approximately).
com.dat <- data.frame(price = c(12, 3, -5, 6, -8, -9, 1, 7))
dat.com <- make.communal(dat, com.dat, start = 1962.000) 




