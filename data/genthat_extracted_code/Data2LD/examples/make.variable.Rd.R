library(Data2LD)


### Name: make.variable
### Title: Check a list of linear differential equation specifications.
### Aliases: make.variable

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
# DefIne a constant basis object
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
XTerm <- make.Xterm(variable=1, derivative=0, ncoef=1, factor=-1, name="reaction")
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
FTerm <- make.Fterm(ncoef=2, Ufd=Valvefd, name="Valve")
FList <- vector("list", 1)
FList[[1]] <- FTerm
#  Define the single differential equation in the first order model
TrayVariable <- make.variable(name="Tray level", order=1, XList=XList, FList=FList)
#  check the object for internal consistency
TrayList=vector("list",1)
TrayList[[1]] <- TrayVariable
#  check the object for internal consistency
TrayList <- modelCheck(TrayList, TrayCoefList)
#
#  Example 2:  The head impact data
#
#  This is a second order model forced by a single pulse function
#  All coefficients are positive
HeadImpactTime <- HeadImpactData[,2]  #  time in milliseconds
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
Xterm0 <- make.Xterm(variable=1, derivative=0, ncoef=1, factor=-1, name="stiffness")
Xterm1 <- make.Xterm(variable=1, derivative=1, ncoef=2, factor=-1, name="viscosity")
# Set up the XList vector of length two
XList <- vector("list",2)
XList[[1]] <- Xterm0
XList[[2]] <- Xterm1
# Define a unit pulse function located at times 14-15
Pulsebasis <- create.bspline.basis(HeadImpactRng, 3, 1, c(0,14,15,60))
Pulsefd    <- fd(matrix(c(0,1,0),3,1),Pulsebasis)
# Define the forcing term
Fterm      <- make.Fterm(ncoef=3, Ufd=Pulsefd, factor=1, name="pulse")
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
#
#  Example 3:  The X coordinate of the fda script data
#
#  The model requires a constant coefficient for the reaction speed
#  and a spline function for the coefficient of the forcing function,
#  which in this model is the unit function.
#  The estimated coefficient function is a step function,
#  or a spline function of order one, with 20 steps.
#  Define the observation times in 100ths of a second
centisec <- seq(0,2.3,len=1401)*100
fdarange <- range(centisec)
#  Define a constant basis
conbasis <- create.constant.basis(fdarange)
#  Define the order one Bspline basis for the coefficient
#  of the forcing term.
nevent    <- 20
nAorder   <- 1
nAbasis   <- nevent
nAknots   <- nAbasis + 1
Aknots    <- seq(fdarange[1],fdarange[2],len=nAknots)
Abasisobj <- create.bspline.basis(fdarange,nAbasis,nAorder,Aknots)
#  Define the two coefficient  functions in this model
coef1 <- make.coef(conbasis,  0.04,                TRUE)
coef2 <- make.coef(Abasisobj, matrix(1,nAbasis,1), TRUE)
# List array containing the coefficient lists
coefList <- vector("list",2)
coefList[[1]] <- coef1
coefList[[2]] <- coef2
# Check the coefficients
coefResult <- coefCheck(coefList)
coefList   <- coefResult$coefList
ntheta     <- coefResult$ntheta
print(paste("ntheta = ",ntheta)) 
#  Set up single homogeneous term in D^2x = -beta x 
Xterm <- make.Xterm(variable=1, derivative=0, ncoef=1, factor=-1, 
                    name="reaction speed")
XList <- vector("list",1)
XList[[1]] <- Xterm
#  Set up coefficient for forcing term \alpha(t)*1
confd <- fd(1,conbasis)
Fterm <- make.Fterm(ncoef=2, Ufd=confd, factor=1, name="steps")
FList <- vector("list", 1)
FList[[1]] <- Fterm
#  make variable for X coefficient of script
Xvariable <- make.variable(name="X", order=2, XList=XList, FList=FList)
#  List array for the whole system
fdaXList = vector("list",1)
fdaXList[[1]] <- Xvariable
#  check the system specification for consistency
fdaXList <- modelCheck(fdaXList, coefList)
#
#  Example 4:  Average temperature in Montreal
#
#  In this example, a coefficient is nonconstant and also
#  a nonlinear function of its parameters.  The reaction speed
#  with which average temperature in Montreal responds to
#  solar forcing is required to be positive.
#  set up five-day block averages with winter centering
#  Here we use 73 five-day block averages as the data with the block
#  centers as the time points in order to speed up computation
daytime73 <- seq(2.5,362.5,len=73)
dayrange  <- c(0,365)
#  set up block averages for Canadian temperature data,
#  available from the fda package
tempav <- CanadianWeather$dailyAv[,,"Temperature.C"]
tempav73 <- matrix(0,73,35)
m2 <- 0
for (  i in 1 : 73 ) {
  m1 <- m2 + 1
  m2 <- m2 + 5
  tempavi <- apply(tempav[m1:m2,1:35],2,mean)
  tempav73[i,] <- tempavi
} 
#  center the time of the year on winter
winterind73  <- c( 37:73,1: 36)
tempav73 <- tempav73[winterind73,]
#  select the data for Montreal
station <- 12 
#  Define the two forcing functions:
#  constant function Ufd for constant forcing
Uconbasis <- create.constant.basis(dayrange)
Uconfd    <- fd(1, Uconbasis)
Uconvec   <- matrix(1,73,1)
#  cosine function for solar radiation forcing
uvec      <- -cos((2*pi/365)*(daytime73+10+182))
Ucosbasis <- create.fourier.basis(dayrange, 3)
Ucosfd    <- smooth.basis(daytime73, uvec, Ucosbasis)$fd
#  A fourier basis for defining the positive homogeneous 
#  coefficient
nWbasis   <- 7
Wbasisobj <- create.fourier.basis(dayrange, nWbasis)
#  constant forcing coefficient for constant forcing
nAbasisC   <- 1
AbasisobjC <- create.constant.basis(dayrange)
#  fourier coefficint function for radiative forcing
nAbasisC   <- 3
AbasisobjC <- create.fourier.basis(dayrange, nAbasisC, 365)
#  constant basis for the cosine forcing
nAbasisF   <- 1
AbasisobjF <- create.constant.basis(dayrange)
#  Set up the list object for the positive coefficient for 
#  the homogeneous term.  
linfun <- list(fd=fun.explinear, Dfd=fun.Dexplinear, more=Wbasisobj)
#  Define the coefficient
coefListW  <-list(fun=linfun, parvec=matrix(0,nWbasis,1), 
                  estimate=TRUE)
#  Coefficient for constant forcing
coefListA1 <- make.coef(fun=AbasisobjC, parvec=1, estimate=TRUE)
#  Coeffcient for cosine forcing
coefListA2 <- make.coef(fun=AbasisobjF, parvec=1, estimate=TRUE)
#  coefList constructed
coefList <- vector("list",3)
coefList[[1]] <- coefListW
coefList[[2]] <- coefListA1
coefList[[3]] <- coefListA2
#  check the coefficient list
coefResult <- coefCheck(coefList)
coefList <- coefResult$coefList
ntheta   <- coefResult$ntheta
print(paste("ntheta = ",ntheta))
#  define homogeneous term and list container
Xterm <- make.Xterm(variable=1, derivative=0, ncoef=1, factor=-1,
                    name="reaction speed")
XList <- vector("list", 1)
XList[[1]] <- Xterm
#  define two forcing terms
Fterm1 <- make.Fterm(Ufd=Uconfd, ncoef=2, factor=1, name="constant")
Fterm2 <- make.Fterm(Ufd=Ucosfd, ncoef=3, factor=1, name="cosine")
#  forcing term container
FList <- vector("list", 2)
FList[[1]] <- Fterm1
FList[[2]] <- Fterm2
#  model list object
TempVar <- make.variable(name="temperature", order=1, XList=XList, FList=FList)
# set up dailyList
dailyList <- vector("list",1)
dailyList[[1]] <- TempVar
dailyList <- modelCheck(dailyList, coefList)



