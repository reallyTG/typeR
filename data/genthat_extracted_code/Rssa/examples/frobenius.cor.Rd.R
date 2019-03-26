library(Rssa)


### Name: frobenius.cor
### Title: Calculate Frobenius correlations of the component matrices
### Aliases: frobenius.cor

### ** Examples

# Separation of two mixed sine-waves with equal amplitudes
N <- 150
L <- 70
omega1 <- 1/5
omega2 <- 1/10

v <- sin(2*pi*omega1 * (1:N)) + sin(2*pi*omega2 * (1:N))
s <- ssa(v, L)
fs <- fossa(s, nested.groups = 1:4, gamma = 100)

# Decomposition is F-orthogonal
plot(frobenius.cor(fs, groups = 1:4), main = "F-correlation matrix")

plot(wcor(s, groups = 1:4))
plot(wcor(fs, groups = 1:4))


# Separate two non-separable sine series with different amplitudes
## No test: 
N <- 150
L <- 70

omega1 <- 0.07
omega2 <- 0.0675

F <- 2*sin(2*pi*omega1 * (1:N)) + 2*sin(2*pi*omega2 * (1:N))
s <- ssa(F, L)
ios <- iossa(s, nested.groups = list(1:2, 3:4),
             kappa = NULL, maxiter = 1000, tol = 1e-5)

plot(reconstruct(ios, groups = ios$iossa.groups))
summary(ios)

# Decomposition is really oblique
plot(frobenius.cor(ios, groups = 1:4), main = "F-correlation matrix")

plot(wcor(ios, groups = 1:4))
plot(owcor(ios, groups = list(1:2, 3:4)), main = "Oblique W-correlation matrix")
## End(No test)


## No test: 
data(USUnemployment)
unempl.male <- USUnemployment[, "MALE"]

s <- ssa(unempl.male)
ios <- iossa(s, nested.groups = list(c(1:4, 7:11), c(5:6, 12:13)))
summary(ios)

# W-cor matrix before IOSSA and w-cor matrix after it
plot(wcor(s, groups = 1:30))
plot(wcor(ios, groups = 1:30))

# Confirmation of the indicated max value in the above warning
plot(frobenius.cor(ios, groups = 1:30), main = "F-correlation matrix")
## End(No test)



