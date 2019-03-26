library(insideRODE)


### Name: cfLSODA
### Title: LSODA Solver for NLME using compiled code(c or fortran)
### Aliases: cfLSODA
### Keywords: math

### ** Examples

#######################################################
#use c code
#cfLSODA SOLVER
#######################################################
rm(list=ls())
require(insideRODE)

data(Theoph)# examples from nlmeODE
TheophODE <- Theoph
TheophODE$Dose[TheophODE$Time!=0] <- 0
TheophODE$Cmt <- rep(1,dim(TheophODE)[1])

# model files
OneComp <- list(DiffEq=list(
                            dy1dt = ~ -ka*y1 ,
                            dy2dt = ~ ka*y1-ke*y2),
                ObsEq=list(
                            c1 = ~ 0,
                            c2 = ~ y2/CL*ke),
                Parms=c("ka","ke","CL"),
                States=c("y1","y2"),
                Init=list(0,0))

TheophModel <- nlmLSODA(OneComp,TheophODE) #ode solver




