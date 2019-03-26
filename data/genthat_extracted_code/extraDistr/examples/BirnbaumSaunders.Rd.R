library(extraDistr)


### Name: BirnbaumSaunders
### Title: Birnbaum-Saunders (fatigue life) distribution
### Aliases: BirnbaumSaunders dfatigue pfatigue qfatigue rfatigue
### Keywords: distribution

### ** Examples


x <- rfatigue(1e5, .5, 2, 5)
hist(x, 100, freq = FALSE)
curve(dfatigue(x, .5, 2, 5), 2, 20, col = "red", add = TRUE)
hist(pfatigue(x, .5, 2, 5))
plot(ecdf(x))
curve(pfatigue(x, .5, 2, 5), 2, 20, col = "red", lwd = 2, add = TRUE)




