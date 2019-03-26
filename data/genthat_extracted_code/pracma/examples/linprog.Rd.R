library(pracma)


### Name: linprog
### Title: Linear Programming Solver
### Aliases: linprog
### Keywords: optimize

### ** Examples

##  Examples from the book "Operations research - A Model-based Approach"
#-- production planning
cc <- c(5, 3.5, 4.5)
Ain <- matrix(c(3, 5, 4,
                6, 1, 3), 2, 3, byrow=TRUE)
bin <- c(540, 480)
linprog(cc, A = Ain, b = bin, maximize = TRUE)
# $x     20   0 120
# $fval  640

#-- diet problem
cc <- c(1.59, 2.19, 2.99)
Ain <- matrix(c(-250, -380, -257,
                 250,  380,  257,
                  13,   31,   28), 3, 3, byrow = TRUE)
bin <- c(-1800, 2200, 100)
linprog(cc, A = Ain, b = bin)

#-- employee scheduling
cc <- c(1, 1, 1, 1, 1, 1)
A <- (-1)*matrix(c(1, 0, 0, 0, 0, 1,
                   1, 1, 0, 0, 0, 0,
                   0, 1, 1, 0, 0, 0,
                   0, 0, 1, 1, 0, 0,
                   0, 0, 0, 1, 1, 0,
                   0, 0, 0, 0, 1, 1), 6, 6, byrow = TRUE)
b <- -c(17, 9, 19, 12, 5, 8)
linprog(cc, A, b)

#-- inventory models
cc <- c(1, 1.1, 1.2, 1.25, 0.05, 0.15, 0.15)
Aeq <- matrix(c(1, 0, 0, 0, -1,  0,  0,
                0, 1, 0, 0,  1, -1,  0,
                0, 0, 1, 0,  0,  1, -1,
                0, 0, 0, 1,  0,  0,  1), 4, 7, byrow = TRUE)
beq <- c(60, 70, 130, 150)
ub <- c(120, 140, 150, 140, Inf, Inf, Inf)
linprog(cc, Aeq = Aeq, beq = beq, ub = ub)

#-- allocation problem
cc <- c(1, 1, 1, 1, 1)
A <- matrix(c(-5,    0,    0,    0,    0,
               0, -4.5,    0,    0,    0,
               0,    0, -5.5,    0,    0,
               0,    0,    0, -3.5,    0,
               0,    0,    0,    0, -5.5,
               5,    0,    0,    0,    0,
               0,  4.5,    0,    0,    0,
               0,    0,  5.5,    0,    0,
               0,    0,    0,  3.5,    0,
               0,    0,    0,    0,  5.5,
              -5, -4.5, -5.5, -3.5, -5.5,
              10, 10.0, 10.0, 10.0, 10.0,
              0.2, 0.2,  0.2, -1.0,  0.2), 13, 5, byrow = TRUE)
b <- c(-50, -55, -60, -50, -50, rep(100, 5), -5*64, 700, 0)
# linprog(cc, A = A, b = b)
lb <- b[1:5] / diag(A[1:5, ])
ub <- b[6:10] / diag(A[6:10, ])
A1 <- A[11:13, ]
b1 <- b[11:13]
linprog(cc, A1, b1, lb = lb, ub = ub)

#-- transportation problem
cc <- c(1, 7, 4, 2, 3, 5)
Aeq <- matrix(c(1, 1, 1, 0, 0, 0,
                0, 0, 0, 1, 1, 1,
                1, 0, 0, 1, 0, 0,
                0, 1, 0, 0, 1, 0,
                0, 0, 1, 0, 0, 1), 5, 6, byrow = TRUE)
beq <- c(30, 20, 15, 25, 10)
linprog(cc, Aeq = Aeq, beq = beq)



