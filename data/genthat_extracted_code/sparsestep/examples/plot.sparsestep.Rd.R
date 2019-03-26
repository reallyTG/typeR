library(sparsestep)


### Name: plot.sparsestep
### Title: Plot the SparseStep path
### Aliases: plot plot.sparsestep

### ** Examples

x <- matrix(rnorm(100*20), 100, 20)
y <- rnorm(100)
fit <- sparsestep(x, y)
plot(fit)
pth <- path.sparsestep(x, y)
plot(pth)



