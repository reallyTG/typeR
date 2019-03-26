library(rrcov)


### Name: maryo
### Title: Marona and Yohai Artificial Data
### Aliases: maryo
### Keywords: datasets

### ** Examples


data(maryo)
getCorr(CovClassic(maryo))          ## the sample correlation is 0.81

## Modify 10%% of the data in the following way:
##  modify two points (out of 20) by interchanging the 
##  largest and smallest value of the first coordinate
imin <- which(maryo[,1]==min(maryo[,1]))        # imin = 9
imax <- which(maryo[,1]==max(maryo[,1]))        # imax = 19
maryo1 <- maryo
maryo1[imin,1] <- maryo[imax,1]
maryo1[imax,1] <- maryo[imin,1]

##  The sample correlation becomes 0.05
plot(maryo1)
getCorr(CovClassic(maryo1))         ## the sample correlation becomes 0.05
getCorr(CovMcd(maryo1))      ## the (reweighted) MCD correlation is 0.79




