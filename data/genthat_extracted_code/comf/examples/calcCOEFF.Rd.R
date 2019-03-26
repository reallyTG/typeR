library(comf)


### Name: calcCOEFF
### Title: Calculation of Coefficients for aPMV, ePMV, aPTS, ePTS
### Aliases: calcCOEFF calcapCoeff calcepCoeff calcasCoeff calcesCoeff
### Keywords: manip

### ** Examples

## Note. Due to random generated asv values. The values for the coefficients will not be meaningful.
## Create sample data
ta  <- 20:24      # vector with air temperature values
tr  <- ta         # vector with radiant temperature values
vel <- rep(.1,5)  # vector with air velocities
rh  <- rep(50,5)  # vector with relative humidity values
clo <- rep(1.0,5) # vector with clo values
met <- rep(1.1,5) # vector with metabolic rates
asv <- rnorm(5)   # vector with actual sensation votes

lsCond <- as.list(data.frame(ta,tr,vel,rh,clo,met,asv))

## Calculate coefficients

calcapCoeff(lsCond)
calcepCoeff(lsCond)
calcasCoeff(lsCond)
calcesCoeff(lsCond)

## use coefficients to calculate apmv
lsCond$apCoeff[1] <- calcapCoeff(lsCond)$apCoeff
calcComfInd(lsCond, request="apmv")



