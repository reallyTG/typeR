library(gasfluxes)


### Name: rlin.fit
### Title: Robust linear concentration - time model
### Aliases: rlin.fit

### ** Examples

#a single fit
t <- c(0, 1/3, 2/3, 1)
C <- c(320, 330, 315, 351)
print(fit <- rlin.fit(t, C, 1, 0.3, "a"))
plot(C ~ t)
curve({fit$f0/0.3 * x + fit$C0}, from = 0, to = 1, add = TRUE)




