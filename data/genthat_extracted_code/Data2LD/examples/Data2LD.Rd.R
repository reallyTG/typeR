library(Data2LD)


### Name: Data2LD
### Title: Evaluate the mean of squared errors data-fitting criterion and
###   its gradient for a system of linear differential equations.
### Aliases: Data2LD

### ** Examples

#
#  Example 1:  The refinery data
#
# The single equation requires two coefficients:
# 1. A constant coefficient for the speed of reaction
# 2. A constant coefficient for the single forcing function
#  Set up the observation times and range 
TimeData <- RefineryData[,"Time"]
TimeRng  <- range(TimeData)
# Defne a constant basis object
conbasis <- create.constant.basis(TimeRng)
#  Define the two coefficient functions and
#  store these in a coefficient function list
TrayCoefList <- vector("list",2)
# Both coefficients are estimated and both have initial value 0.
TrayCoefList[[1]] <- make.coef(fun=conbasis, parvec=0, estimate=TRUE)
TrayCoefList[[2]] <- make.coef(fun=conbasis, parvec=0, estimate=TRUE)
#  Run a check on the coefficient List array, 
#  which also counts the number of estimated parameters
TraycoefResult <- coefCheck(TrayCoefList)
TrayCoefList   <- TraycoefResult$coefList
TrayNtheta     <- TraycoefResult$ntheta
print(paste("ntheta = ",TrayNtheta))
#  Define single homogeneous term with order zero derivative, 
#  constant multiplier -1, and defined by the first coeffcient
XTerm <- make.Xterm(variable=1, derivative=0, ncoef=1, factor=-1)
XList <- vector("list", 1)
XList[[1]] <- XTerm
#  Define the step forcing function for the valve setting
Valvebreaks <- c(0,67,193)
Valvenbasis <- 2
Valvenorder <- 1
ValveBasis  <- create.bspline.basis(TimeRng, Valvenbasis, Valvenorder, Valvebreaks)
#  smooth the valve setting data to define the step forcing function
ValveData <- RefineryData[,"Valve.setting"]
Valvefd   <- smooth.basis(TimeData, ValveData, ValveBasis)$fd
#  Define the FList object for the single forcing function
FTerm <- make.Fterm(ncoef=2, Ufd=Valvefd)
FList <- vector("list", 1)
FList[[1]] <- FTerm
#  Define the single differential equation in the first order model
TrayVariable <- make.variable(name="Tray level", order=1, XList=XList, FList=FList)
#  check the object for internal consistency
TrayList=vector("list",1)
TrayList[[1]] <- TrayVariable
#  check the object for internal consistency
TrayModelList <- modelCheck(TrayList, TrayCoefList)
#  Define the List array containing the tray data
Tray.yList <- list(argvals=RefineryData[,"Time"], 
                   y      =RefineryData[,"Tray.level"])
TrayDataList  <- vector("list",1)
TrayDataList[[1]] <- Tray.yList
# Construct the basis object for tray variable
#  Order 5 spline basis with four knots at the 67
#   to allow discontinuity in the first derivative
#  and 15 knots between 67 and 193
Traynorder <- 5
Traybreaks <- c(0, rep(67,3), seq(67, 193, len=15))
Traynbasis <- 22
TrayBasis  <- create.bspline.basis(c(0,193), Traynbasis, Traynorder, Traybreaks)
#  Set up the basis list for the tray variable
TrayBasisList    <- vector("list",1)
TrayBasisList[[1]] <- TrayBasis
#  Set smoothing constant rho to a value specifying light smoothing
rhoVec <- 0.5 
#  Evaluate the fit to the data given the initial parameter estimates (0 and 0)
#  This also initializes the four-way tensors so that they are not re-computed
#  for subsquent analyses.
Data2LDList <- Data2LD(TrayDataList, TrayBasisList, TrayModelList, TrayCoefList, rhoVec)
#MSE  <- Data2LDList$MSE    # Mean squared error for fit to data
#DMSE <- Data2LDList$DpMSE  #  gradient with respect to parameter values
#
#  Example 2:  The head impact data
#
#  This is a second order model forced by a single pulse function
#  All coefficients are positive
HeadImpactTime <- HeadImpactData[,2]  #  time in milliseconds
HeadImpact     <- HeadImpactData[,3]  #  time in milliseconds
HeadImpactRng  <- c(0,60) # Define range time for estimated model
# Set up the constant basis
conbasis <- create.constant.basis(HeadImpactRng)
# Define the three constant coefficient functions
coef1 <- make.coef(fun=conbasis, parvec=0, estimate=TRUE)
coef2 <- make.coef(fun=conbasis, parvec=0, estimate=TRUE)
coef3 <- make.coef(fun=conbasis, parvec=0, estimate=TRUE)
#  Set up the coefficient list
coefList  <- vector("list",3)
coefList[[1]] <- coef1
coefList[[2]] <- coef2
coefList[[3]] <- coef3
#  check coefficient list
coefCheckList <- coefCheck(coefList)
coefList      <- coefCheckList$coefList
ntheta        <- coefCheckList$ntheta
print(paste("ntheta = ",ntheta))
# Define the two terms in the homogeneous part of the equation
Xterm0 <- make.Xterm(variable=1, derivative=0, ncoef=1, factor=-1)
Xterm1 <- make.Xterm(variable=1, derivative=1, ncoef=2, factor=-1)
# Set up the XList vector of length two
XList <- vector("list",2)
XList[[1]] <- Xterm0
XList[[2]] <- Xterm1
# Define a unit pulse function located at times 14-15
Pulsebasis <- create.bspline.basis(HeadImpactRng, 3, 1, c(0,14,15,60))
Pulsefd    <- fd(matrix(c(0,1,0),3,1),Pulsebasis)
# Define the forcing term
Fterm      <- make.Fterm(ncoef=3, Ufd=Pulsefd, factor=1)
# Set up the forcing term list of length one
FList      <- vector("list",1) 
FList[[1]] <- Fterm
#  Define the single differential equation in the model
HeadImpactVariable <- make.variable(order=2, XList=XList, FList=FList)
#  Define list of length one containing the equation definition
HeadImpactList=vector("list",1)
HeadImpactList[[1]] <- HeadImpactVariable
#  check the object for internal consistency
HeadImpactList <- modelCheck(HeadImpactList, coefList)
#  Define the List array containing the data
yList1 <- list(argvals=HeadImpactTime, y=HeadImpact)
yList <- vector("list",1)
yList[[1]] <- yList1
#  Construct basis for output x(t), multiple knots at times 14 and 15
#  Order 6 spline basis, with three knots at the impact point and 
#  three knots at impact + delta to permit discontinuous first 
#  derivatives at these points
knots     <- c(0,14,14,14,15,15,seq(15,60,len=11))
norder    <- 6
nbasis    <- 21
HeadImpactBasis <- create.bspline.basis(HeadImpactRng,nbasis,norder,knots)
#  set up basis list
XbasisList <- vector("list",1)
XbasisList[[1]] <- HeadImpactBasis
# An evaluation of the criterion at the initial values
rhoVec <- 0.5  #  light smoothing
#  This command causes Data2LD to set up and save the tensors
# Data2LDResult <- Data2LD(yList, XbasisList, modelList, coefList, rhoVec)
# MSE  <- Data2LDList$MSE    # Mean squared error for fit to data
# DMSE <- Data2LDList$DpMSE  #  gradient with respect to parameter values



