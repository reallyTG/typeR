library(ks)


### Name: kde.local.test
### Title: Kernel density based local two-sample comparison test
### Aliases: kde.local.test
### Keywords: test

### ** Examples

library(MASS)
x1 <- crabs[crabs$sp=="B", 4]
x2 <- crabs[crabs$sp=="O", 4]
loct <- kde.local.test(x1=x1, x2=x2)
plot(loct)

## see examples in ? plot.kde.loctest



