library(Rssa)


### Name: iossa
### Title: Iterative O-SSA nested decomposition
### Aliases: iossa iossa.ssa

### ** Examples

# Separate three non-separable sine series with different amplitudes
N <- 150
L <- 70

omega1 <- 0.05
omega2 <- 0.06
omega3 <- 0.07

F <- 4*sin(2*pi*omega1 * (1:N)) + 2*sin(2*pi*omega2 * (1:N)) + sin(2*pi*omega3 * (1:N))
s <- ssa(F, L)
ios <- iossa(s, nested.groups = list(1:2, 3:4, 5:6), kappa = NULL, maxiter = 100, tol = 1e-3)

plot(reconstruct(ios, groups = ios$iossa.groups))
summary(ios)

## No test: 
# Separate two non-separable sines with equal amplitudes
N <- 200
L <- 100
omega1 <- 0.07
omega2 <- 0.06

F <- sin(2*pi*omega1 * (1:N)) + sin(2*pi*omega2 * (1:N))
s <- ssa(F, L)

# Apply FOSSA and then IOSSA
fs <- fossa(s, nested.groups = 1:4)
ios <- iossa(fs, nested.groups = list(1:2, 3:4), maxiter = 100)
summary(ios)

opar <- par(mfrow = c(3, 1))
plot(reconstruct(s, groups = list(1:2, 3:4)))
plot(reconstruct(fs, groups = list(1:2, 3:4)))
plot(reconstruct(ios, groups = ios$iossa.groups))
par(opar)

wo <- plot(wcor(ios, groups = 1:4))
gwo <- plot(owcor(ios, groups = 1:4))
plot(wo, split = c(1, 1, 2, 1), more = TRUE)
plot(gwo, split = c(2, 1, 2, 1), more = FALSE)
## End(No test)

## No test: 
data(USUnemployment)
unempl.male <- USUnemployment[, "MALE"]

s <- ssa(unempl.male)
ios <- iossa(s, nested.groups = list(c(1:4, 7:11), c(5:6, 12:13)))
summary(ios)

# Comparison of reconstructions
rec <- reconstruct(s, groups = list(c(1:4, 7:11), c(5:6, 12:13)))
iorec <- reconstruct(ios, groups <- ios$iossa.groups)
# Trends
matplot(data.frame(iorec$F1, rec$F1, unempl.male), type='l',
        col=c("red","blue","black"), lty=c(1,1,2))
# Seasonalities
matplot(data.frame(iorec$F2, rec$F2), type='l', col=c("red","blue"),lty=c(1,1))

# W-cor matrix before IOSSA and w-cor matrix after it
ws <- plot(wcor(s, groups = 1:30), grid = 14)
wios <- plot(wcor(ios, groups = 1:30), grid = 14)
plot(ws, split = c(1, 1, 2, 1), more = TRUE)
plot(wios, split = c(2, 1, 2, 1), more = FALSE)

# Eigenvectors before and after Iterative O-SSA
plot(s, type = "vectors", idx = 1:13)
plot(ios, type = "vectors", idx = 1:13)

# 2D plots of periodic eigenvectors before and after Iterative O-SSA
plot(s, type = "paired", idx = c(5, 12))
plot(ios, type = "paired", idx = c(10, 12), plot.contrib = FALSE)

data(AustralianWine)
Fortified <- AustralianWine[, "Fortified"]
s <- ssa(window(Fortified, start = 1982 + 5/12, end = 1986 + 5/12), L = 18)
ios <- iossa(s, nested.groups = list(trend = 1, 2:7),
             kappa = NULL,
             maxIter = 1)
fs <- fossa(s, nested.groups = 1:7, gamma = 1000)

rec.ssa <- reconstruct(s, groups = list(trend = 1, 2:7))
rec.iossa <- reconstruct(ios, groups = ios$iossa.groups);
rec.fossa <- reconstruct(fs, groups = list(trend = 7, 1:6))

Fort <- cbind(`Basic SSA trend` = rec.ssa$trend,
              `Iterative O-SSA trend` = rec.iossa$trend,
              `DerivSSA trend` = rec.fossa$trend,
              `Full series` = Fortified)

library(lattice)
xyplot(Fort, superpose = TRUE, col = c("red", "blue", "green4", "black"))
## End(No test)


# Shaped 2D I. O-SSA separates finite rank fields exactly
mx1 <- outer(1:50, 1:50,
             function(i, j) exp(i/25 - j/20))
mx2 <- outer(1:50, 1:50,
             function(i, j) sin(2*pi * i/17) * cos(2*pi * j/7))

mask <- matrix(TRUE, 50, 50)
mask[23:25, 23:27] <- FALSE
mask[1:2, 1] <- FALSE
mask[50:49, 1] <- FALSE
mask[1:2, 50] <- FALSE

mx1[!mask] <- mx2[!mask] <- NA

s <- ssa(mx1 + mx2, kind = "2d-ssa", L = c(10, 10))
plot(reconstruct(s, groups = list(1, 2:5)))

ios <- iossa(s, nested.groups = list(1, 2:5), kappa = NULL)
plot(reconstruct(ios, groups = ios$iossa.groups))

## No test: 
# I. O-SSA for MSSA
N.A <- 150
N.B <- 120
L <- 40

omega1 <- 0.05
omega2 <- 0.055

tt.A <- 1:N.A
tt.B <- 1:N.B
F1 <- list(A = 2 * sin(2*pi * omega1 * tt.A), B = cos(2*pi * omega1 * tt.B))
F2 <- list(A = 1 * sin(2*pi * omega2 * tt.A), B = cos(2*pi * omega2 * tt.B))

F <- list(A = F1$A + F2$A, B = F1$B + F2$B)

s <- ssa(F, kind = "mssa")
plot(reconstruct(s, groups = list(1:2, 3:4)), plot.method = "xyplot")

ios <- iossa(s, nested.groups = list(1:2, 3:4), kappa = NULL)
plot(reconstruct(ios, groups = ios$iossa.groups), plot.method = "xyplot")
## End(No test)



