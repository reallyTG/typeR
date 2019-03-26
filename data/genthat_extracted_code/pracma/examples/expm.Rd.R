library(pracma)


### Name: expm
### Title: Matrix Exponential
### Aliases: expm logm
### Keywords: math

### ** Examples

##  The Ward test cases described in the help for expm::expm agree up to
##  10 digits with the values here and with results from Matlab's expm !
A <- matrix(c(-49, -64, 24, 31), 2, 2)
expm(A)
# -0.7357588 0.5518191
# -1.4715176 1.1036382

A1 <- matrix(c(10,  7,  8,  7,
                7,  5,  6,  5,
                8,  6, 10,  9,
                7,  5,  9, 10), nrow = 4, ncol = 4, byrow = TRUE)
expm(logm(A1))
logm(expm(A1))

##  System of linear differential equations: y' = M y  (y = c(y1, y2, y3))
M <- matrix(c(2,-1,1, 0,3,-1, 2,1,3), 3, 3, byrow=TRUE)
M
C1 <- 0.5; C2 <- 1.0; C3 <- 1.5
t  <- 2.0; Mt <- expm(t * M)
yt <- Mt 



