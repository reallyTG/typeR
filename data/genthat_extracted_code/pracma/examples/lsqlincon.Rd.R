library(pracma)


### Name: lsqlincon
### Title: Linear Least-Squares Fitting with linear constraints
### Aliases: lsqlincon
### Keywords: optimize

### ** Examples

##  MATLABs lsqlin example
C <- matrix(c(
    0.9501,   0.7620,   0.6153,   0.4057,
    0.2311,   0.4564,   0.7919,   0.9354,
    0.6068,   0.0185,   0.9218,   0.9169,
    0.4859,   0.8214,   0.7382,   0.4102,
    0.8912,   0.4447,   0.1762,   0.8936), 5, 4, byrow=TRUE)
d <- c(0.0578, 0.3528, 0.8131, 0.0098, 0.1388)
A <- matrix(c(
    0.2027,   0.2721,   0.7467,   0.4659,
    0.1987,   0.1988,   0.4450,   0.4186,
    0.6037,   0.0152,   0.9318,   0.8462), 3, 4, byrow=TRUE)
b <- c(0.5251, 0.2026, 0.6721)
Aeq <- matrix(c(3, 5, 7, 9), 1)
beq <- 4
lb <- rep(-0.1, 4)   # lower and upper bounds
ub <- rep( 2.0, 4)

x <- lsqlincon(C, d, A, b, Aeq, beq, lb, ub)
# -0.1000000 -0.1000000  0.1599088  0.4089598
# check A %*% x - b >= 0
# check Aeq %*% x - beq == 0
# check sum((C %*% x - d)^2)    # 0.1695104



