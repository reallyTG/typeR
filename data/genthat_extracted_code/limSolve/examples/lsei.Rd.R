library(limSolve)


### Name: lsei
### Title: Least Squares with Equalities and Inequalities
### Aliases: lsei
### Keywords: algebra array optimize

### ** Examples

# ------------------------------------------------------------------------------
# example 1: polynomial fitting
# ------------------------------------------------------------------------------
x <- 1:5
y <- c(9, 8, 6, 7, 5)
plot(x, y, main = "Polynomial fitting, using lsei", cex = 1.5, 
     pch = 16, ylim = c(4, 10))

# 1-st order
A <- cbind(rep(1, 5), x)
B <- y
cf <- lsei(A, B)$X
abline(coef = cf)

# 2-nd order
A <- cbind(A, x^2)
cf <- lsei(A, B)$X
curve(cf[1] + cf[2]*x + cf[3]*x^2, add = TRUE, lty = 2)

# 3-rd order
A <- cbind(A, x^3)
cf <- lsei(A, B)$X
curve(cf[1] + cf[2]*x + cf[3]*x^2 + cf[4]*x^3, add = TRUE, lty = 3)

# 4-th order
A <- cbind(A, x^4)
cf <- lsei(A, B)$X
curve(cf[1] + cf[2]*x + cf[3]*x^2 + cf[4]*x^3 + cf[5]*x^4, 
      add = TRUE, lty = 4)
legend("bottomleft", c("1st-order", "2nd-order","3rd-order","4th-order"),
       lty = 1:4)

# ------------------------------------------------------------------------------
# example 2: equalities, approximate equalities and inequalities
# ------------------------------------------------------------------------------

A <- matrix(nrow = 4, ncol = 3,
            data = c(3, 1, 2, 0, 2, 0, 0, 1, 1, 0, 2, 0))
B <- c(2, 1, 8, 3)
E <- c(0, 1, 0)
F <- 3
G <- matrix(nrow = 2, ncol = 3, byrow = TRUE,
            data = c(-1, 2, 0, 1, 0, -1))
H <- c(-3, 2)

lsei(E = E, F = F, A = A, B = B, G = G, H = H)



