library(deSolve)


### Name: lsodes
### Title: Solver for Ordinary Differential Equations (ODE) With Sparse
###   Jacobian
### Aliases: lsodes
### Keywords: math

### ** Examples

## Various ways to solve the same model.

## =======================================================================
## The example from lsodes source code
## A chemical model
## =======================================================================

n  <- 12
y  <- rep(1, n)
dy <- rep(0, n)

times <- c(0, 0.1*(10^(0:4)))

rtol <- 1.0e-4
atol <- 1.0e-6

parms <- c(rk1  = 0.1,   rk2 = 10.0, rk3 = 50.0,  rk4 = 2.5,  rk5 = 0.1,
           rk6  = 10.0,  rk7 = 50.0, rk8 = 2.5,   rk9 = 50.0, rk10 = 5.0,
           rk11 = 50.0, rk12 = 50.0,rk13 = 50.0, rk14 = 30.0,
           rk15 = 100.0,rk16 = 2.5, rk17 = 100.0,rk18 = 2.5,
           rk19 = 50.0, rk20 = 50.0)

#
chemistry <- function (time, Y, pars) {
  with (as.list(pars), {
    dy[1] <- -rk1 *Y[1]
    dy[2] <-  rk1 *Y[1]        + rk11*rk14*Y[4]  + rk19*rk14*Y[5]  -
              rk3 *Y[2]*Y[3]   - rk15*Y[2]*Y[12] - rk2*Y[2]
    dy[3] <-  rk2 *Y[2]        - rk5 *Y[3]       - rk3*Y[2]*Y[3]   -
              rk7*Y[10]*Y[3]   + rk11*rk14*Y[4]   + rk12*rk14*Y[6]
    dy[4] <-  rk3 *Y[2]*Y[3]   - rk11*rk14*Y[4]  - rk4*Y[4]
    dy[5] <-  rk15*Y[2]*Y[12]  - rk19*rk14*Y[5]  - rk16*Y[5]
    dy[6] <-  rk7 *Y[10]*Y[3]  - rk12*rk14*Y[6]  - rk8*Y[6]
    dy[7] <-  rk17*Y[10]*Y[12] - rk20*rk14*Y[7]  - rk18*Y[7]
    dy[8] <-  rk9 *Y[10]       - rk13*rk14*Y[8]  - rk10*Y[8]
    dy[9] <-  rk4 *Y[4]        + rk16*Y[5]       + rk8*Y[6]         +
              rk18*Y[7]
    dy[10] <- rk5 *Y[3]        + rk12*rk14*Y[6]  + rk20*rk14*Y[7]   +
              rk13*rk14*Y[8]   - rk7 *Y[10]*Y[3] - rk17*Y[10]*Y[12] -
              rk6 *Y[10]       - rk9*Y[10]
    dy[11] <- rk10*Y[8]
    dy[12] <- rk6 *Y[10]       + rk19*rk14*Y[5]  + rk20*rk14*Y[7]   -
              rk15*Y[2]*Y[12]  - rk17*Y[10]*Y[12]
    return(list(dy))
  })
}

## =======================================================================
## application 1. lsodes estimates the structure of the Jacobian
##                and calculates the Jacobian by differences
## =======================================================================
out <- lsodes(func = chemistry, y = y, parms = parms, times = times,
              atol = atol, rtol = rtol, verbose = TRUE)

## =======================================================================
## application 2. the structure of the Jacobian is input
##                lsodes calculates the Jacobian by differences
##                this is not so efficient...
## =======================================================================

## elements of Jacobian that are not zero
nonzero <-  matrix(nc = 2, byrow = TRUE, data = c(
  1, 1,   2, 1,    # influence of sp1 on rate of change of others
  2, 2,   3, 2,   4, 2,   5, 2,  12, 2,
  2, 3,   3, 3,   4, 3,   6, 3,  10, 3,
  2, 4,   3, 4,   4, 4,   9, 4,  # d (dyi)/dy4
  2, 5,   5, 5,   9, 5,  12, 5,
  3, 6,   6, 6,   9, 6,  10, 6,
  7, 7,   9, 7,  10, 7,  12, 7,
  8, 8,  10, 8,  11, 8,
  3,10,   6,10,   7,10,   8,10,  10,10,  12,10,
  2,12,   5,12,   7,12,  10,12,  12,12)
)

## when run, the default length of rwork is too small
## lsodes will tell the length actually needed
# out2 <- lsodes(func = chemistry, y = y, parms = parms, times = times,
#              inz = nonzero, atol = atol,rtol = rtol)  #gives warning
out2 <- lsodes(func = chemistry, y = y, parms = parms, times = times, 
            sparsetype = "sparseusr", inz = nonzero,   
             atol = atol, rtol = rtol, verbose = TRUE, lrw = 353)
                            
## =======================================================================
## application 3. lsodes estimates the structure of the Jacobian
##                the Jacobian (vector) function is input
## =======================================================================
chemjac <- function (time, Y, j, pars) {
  with (as.list(pars), {
    PDJ <- rep(0,n)

    if (j == 1){
       PDJ[1] <- -rk1
       PDJ[2] <- rk1
    } else if (j == 2) {
       PDJ[2] <- -rk3*Y[3] - rk15*Y[12] - rk2
       PDJ[3] <- rk2 - rk3*Y[3]
       PDJ[4] <- rk3*Y[3]
       PDJ[5] <- rk15*Y[12]
       PDJ[12] <- -rk15*Y[12]
    } else if (j == 3) {
       PDJ[2] <- -rk3*Y[2]
       PDJ[3] <- -rk5 - rk3*Y[2] - rk7*Y[10]
       PDJ[4] <- rk3*Y[2]
       PDJ[6] <- rk7*Y[10]
       PDJ[10] <- rk5 - rk7*Y[10]
    } else if (j == 4) {
       PDJ[2] <- rk11*rk14
       PDJ[3] <- rk11*rk14
       PDJ[4] <- -rk11*rk14 - rk4
       PDJ[9] <- rk4
    } else if (j == 5) {
       PDJ[2] <- rk19*rk14
       PDJ[5] <- -rk19*rk14 - rk16
       PDJ[9] <- rk16
       PDJ[12] <- rk19*rk14
    } else if (j == 6) {
       PDJ[3] <- rk12*rk14
       PDJ[6] <- -rk12*rk14 - rk8
       PDJ[9] <- rk8
       PDJ[10] <- rk12*rk14
    } else if (j == 7) {
       PDJ[7] <- -rk20*rk14 - rk18
       PDJ[9] <- rk18
       PDJ[10] <- rk20*rk14
       PDJ[12] <- rk20*rk14
    } else if (j == 8) {
       PDJ[8] <- -rk13*rk14 - rk10
       PDJ[10] <- rk13*rk14
       PDJ[11] <- rk10
    } else if (j == 10) {
       PDJ[3] <- -rk7*Y[3]
       PDJ[6] <- rk7*Y[3]
       PDJ[7] <- rk17*Y[12]
       PDJ[8] <- rk9
       PDJ[10] <- -rk7*Y[3] - rk17*Y[12] - rk6 - rk9
       PDJ[12] <- rk6 - rk17*Y[12]
    } else if (j == 12) {
       PDJ[2] <- -rk15*Y[2]
       PDJ[5] <- rk15*Y[2]
       PDJ[7] <- rk17*Y[10]
       PDJ[10] <- -rk17*Y[10]
       PDJ[12] <- -rk15*Y[2] - rk17*Y[10]
    }
    return(PDJ)
  })
} 

out3 <- lsodes(func = chemistry, y = y, parms = parms, times = times,
              jacvec = chemjac, atol = atol, rtol = rtol)

## =======================================================================
## application 4. The structure of the Jacobian (nonzero elements) AND
##                the Jacobian (vector) function is input
## =======================================================================
out4 <- lsodes(func = chemistry, y = y, parms = parms, times = times,
               lrw = 351, sparsetype = "sparseusr", inz = nonzero,
               jacvec = chemjac, atol = atol, rtol = rtol,
               verbose = TRUE)
               
# The sparsejan variant 
# note: errors in inz may cause R to break, so this is not without danger...
# out5 <- lsodes(func = chemistry, y = y, parms = parms, times = times,
#               jacvec = chemjac, atol = atol, rtol = rtol, sparsetype = "sparsejan",
#               inz = c(1,3,8,13,17,21,25,29,32,32,38,38,43,                   # ian
#               1,2, 2,3,4,5,12, 2,3,4,6,10, 2,3,4,9, 2,5,9,12, 3,6,9,10,      # jan 
#               7,9,10,12, 8,10,11, 3,6,7,8,10,12, 2,5,7,10,12), lrw = 343) 




