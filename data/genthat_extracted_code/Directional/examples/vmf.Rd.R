library(Directional)


### Name: MLE of the von Mises-Fisher distribution
### Title: MLE of von Mises-Fisher distribution
### Aliases: vmf
### Keywords: Maximum likelihood estimation von Mises-Fisher distribution

### ** Examples

m <- rnorm(3)
m <- m/sqrt(sum(m^2))
m
x <- rvmf(100, m, 7)
vmf(x)
x <- rvmf(500, m, 7)
vmf(x)



