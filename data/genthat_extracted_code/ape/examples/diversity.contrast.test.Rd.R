library(ape)


### Name: diversity.contrast.test
### Title: Diversity Contrast Test
### Aliases: diversity.contrast.test
### Keywords: htest

### ** Examples

### data from Vamosi & Vamosi (2005):
fleshy <- c(1, 1, 1, 1, 1, 3, 3, 5, 9, 16, 33, 40, 50, 100, 216, 393, 850, 947,1700)
dry <- c(2, 64, 300, 89, 67, 4, 34, 10, 150, 35, 2, 60, 81, 1, 3, 1, 11, 1, 18)
x <- cbind(fleshy, dry)
diversity.contrast.test(x)
diversity.contrast.test(x, alt = "g")
diversity.contrast.test(x, alt = "g", nrep = 1e4)
slowinskiguyer.test(x)
mcconwaysims.test(x)



