library(ks)


### Name: plot.kde.loctest
### Title: Plot for kernel local significant difference regions
### Aliases: plot.kde.loctest
### Keywords: hplot

### ** Examples

library(MASS)
data(crabs)
x1 <- crabs[crabs$sp=="B", c(4,6)]
x2 <- crabs[crabs$sp=="O", c(4,6)]
loct <- kde.local.test(x1=x1, x2=x2)
plot(loct)



