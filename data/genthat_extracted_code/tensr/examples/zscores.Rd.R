library(tensr)


### Name: zscores
### Title: Normal scores.
### Aliases: zscores

### ** Examples

y <- rexp(100)
z <- tensr:::zscores(y)
par(mfrow = c(1, 3))
hist(y)
hist(z)
plot(y,z)



