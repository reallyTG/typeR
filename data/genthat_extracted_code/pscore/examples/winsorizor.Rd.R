library(pscore)


### Name: winsorizor
### Title: Winsorize at specified percentiles
### Aliases: winsorizor

### ** Examples

dev.new(width = 10, height = 5)
par(mfrow = c(1, 2))
hist(as.vector(eurodist), main = "Eurodist")
hist(winsorizor(as.vector(eurodist), .05), main = "Eurodist with lower and upper\n5% winsorized")



