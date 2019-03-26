library(flood)


### Name: TailAnova
### Title: Heavy-tail ANOVA
### Aliases: TailAnova

### ** Examples

library("evd")
set.seed(6754)
x1 <- rgev(150, loc = 2, scale = 1, shape=0.4)
x2 <- rgev(150, loc = 2.5, scale = 1, shape=0.1) # H_0 violated because of different shapes
x <- cbind(x1, x2)
TailAnova(x)

x1 <- rgev(150, loc = 2, scale = 1, shape=0.3)
x2 <- rgev(150, loc = 2.5, scale = 1, shape=0.3) # H_0 not violated because of same shapes
x <- cbind(x1, x2)
TailAnova(x)



