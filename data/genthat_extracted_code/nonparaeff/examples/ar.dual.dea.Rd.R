library(nonparaeff)


### Name: ar.dual.dea
### Title: Assurance Region Data Envelopment Aanlysis (AR-DEA)
### Aliases: ar.dual.dea
### Keywords: Data Envelopment Analysis

### ** Examples


## AR constraint of 0.25 <= v2/v1 <= 1.
library(Hmisc)
library(lpSolve)
ar.dat <- data.frame(y = c(1, 1, 1, 1, 1, 1),
                     x1 = c(2, 3, 6, 3, 6, 6),
                     x2 = c(5, 3, 1, 8, 4, 2))
(re <-
ar.dual.dea(ar.dat, noutput = 1, orientation = 1, rts = 1, ar.l =
matrix(c(0, 0, 0.25, -1, -1, 1), nrow = 2, ncol = 3), ar.r = c(0, 0),
ar.dir = c("<=", "<=")))




