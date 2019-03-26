library(Rssa)


### Name: owcor
### Title: Calculate generalized (oblique) W-correlation matrix
### Aliases: owcor

### ** Examples

# Separate two non-separable sines
N <- 150
L <- 70

omega1 <- 0.06
omega2 <- 0.065

F <- 4*sin(2*pi*omega1 * (1:N)) + sin(2*pi*omega2 * (1:N))
s <- ssa(F, L)
ios <- iossa(s, nested.groups = list(1:2, 3:4), kappa = NULL, maxIter = 200, tol = 1e-8)

p.wcor <- plot(wcor(ios, groups = list(1:2, 3:4)))
p.owcor <- plot(owcor(ios, groups = list(1:2, 3:4)), main = "OW-correlation matrix")
print(p.wcor, split = c(1, 1, 2, 1), more = TRUE)
print(p.owcor, split = c(2, 1, 2, 1))



