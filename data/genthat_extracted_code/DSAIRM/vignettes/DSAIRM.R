## ---- eval=FALSE, echo=TRUE----------------------------------------------
#  library('DSAIRM')

## ---- eval=FALSE, echo=TRUE----------------------------------------------
#  dsairmmenu()

## ---- eval=TRUE, echo=FALSE, message=FALSE-------------------------------
library('DSAIRM')

## ----eval=FALSE, echo=TRUE-----------------------------------------------
#  help('simulate_basicbacteria_ode')

## ---- eval=TRUE, echo=TRUE-----------------------------------------------
result <- simulate_basicbacteria_ode(B = 500, I = 5, g = 1, r = 0.002, dI = 1 )

## ---- eval=TRUE, echo=TRUE-----------------------------------------------
plot(result$ts[,"time"],result$ts[,"B"],xlab='time',ylab='Bacteria Numbers',type='l')

## ---- eval=TRUE, echo=TRUE-----------------------------------------------
rvec = 10^seq(-5,-2,length=20) #values of log immune activation rate, r, for which to run the simulation 
peak = rep(0,length(rvec)) #this will record the peak values for each r
for (n in 1:length(rvec))
{
  #call the simulator function with different values of r, other parameters stay at their defaults
  result <- simulate_basicbacteria_ode(r = rvec[n])
  peak[n] <- max(result$ts[,"B"]) #record max number of bacteria for each value of r
}
#plot final result
plot(rvec,peak,type='p',xlab='Immune activation rate',ylab='Max number of bacteria',log='xy')

## ---- eval=FALSE, echo=TRUE----------------------------------------------
#  system.file("simulatorfunctions", package = "DSAIRM")

## ----eval=FALSE, echo=TRUE-----------------------------------------------
#  simulate_basicbacteria_ode <- function(B = 10, I = 1, g = 1, Bmax = 1e+05, dB = 0.1, k = 1e-06, r = 0.001, dI = 1, tstart = 0, tfinal = 30, dt = 0.05)

## ----eval=FALSE, echo=TRUE, color='red'----------------------------------
#  mysimulator <- function(B = 10, I = 1, g = 1, Bmax = 1e+05, dB = 0.1, k = 1e-06, r=1e3, dI=1, tstart = 0, tfinal = 30, dt = 0.05, s=1E3)

## ----eval=FALSE, echo=TRUE-----------------------------------------------
#  pars = c(g=g,Bmax=Bmax,dB=dB,k=k,r=r,dI=dI)

## ----eval=FALSE, echo=TRUE, color='red'----------------------------------
#  pars = c(g=g,Bmax=Bmax,dB=dB,k=k,r=r,dI=dI,s=s)

## ----eval=FALSE, echo=TRUE-----------------------------------------------
#  dBdt = g*B*(1-B/Bmax) - dB*B - k*B*I
#  dIdt = r*B*I - dI*I

## ----eval=FALSE, echo=TRUE, color='red'----------------------------------
#  dBdt = g*B*(1-B/Bmax) - dB*B - k*B*I
#  dIdt = r*B*I/(s+B) - dI*I

## ----eval=TRUE, echo=TRUE------------------------------------------------
source('mysimulator.R') #to initialize the new function - it needs to be in the working directory
svec = 10^seq(-3,3,length=20) #values of saturation parameter 
Imax = rep(0,length(svec)) #this will record the maximum immune response level
for (n in 1:length(svec))
{
  result <- mysimulator(s = svec[n]) #all other inputs are kept at their defaults
  Imax[n] <- max(result$ts[,"I"])
}
plot(svec,Imax,type='p',xlab='Saturation parameter',ylab='Max immune response level',log='xy')

