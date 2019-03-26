library(Rssa)


### Name: iossa.result
### Title: Summary of Iterative O-SSA results
### Aliases: iossa.result print.iossa.result summary.iossa.result

### ** Examples

## No test: 
# Separate three non-separable sines with different amplitudes
N <- 150
L <- 70

omega1 <- 0.05
omega2 <- 0.06
omega3 <- 0.07

F <- 4*sin(2*pi*omega1 * (1:N)) + 2*sin(2*pi*omega2 * (1:N)) + sin(2*pi*omega3 * (1:N))
s <- ssa(F, L)
ios <- iossa(s, nested.groups = list(1:2, 3:4, 5:6), kappa = NULL, maxiter = 100, tol = 1e-3)

print(ios)
print(ios$iossa.result)
## End(No test)



