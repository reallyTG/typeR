library(DrBats)


### Name: drbats.simul
### Title: Main simulation function
### Aliases: drbats.simul

### ** Examples

res <- drbats.simul(N = 5, P = 100, t.range = c(5, 100), breaks = 8)
X <- res$X
t <- res$t.simul
# To plot the observations, ie the rows
matplot(t(t), t(X), type = 'l', xlab = "Time", ylab = "X")




