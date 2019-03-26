library(comf)


### Name: calcPtsadj
### Title: Calculating the Predicted Thermal Sensation based on 2-Node
###   Model adjusted for Adaptation or Expectancy
### Aliases: calcPtsadj calcPtsa calcPtse Ptsadj Ptsa Ptse ptsadj ptsa ptse
### Keywords: manip

### ** Examples

## Note. Due to random generated asv values. The values for the coefficients will not be meaningful.
## Create sample data
ta  <- 20:24     # vector with air temperature values
tr  <- ta         # vector with radiant temperature values
vel <- rep(.1,5)  # vector with air velocities
rh  <- rep(50,5)  # vector with relative humidity values
clo <- rep(1.0,5) # vector with clo values
met <- rep(1.1,5) # vector with metabolic rates
asv <- rnorm(5)   # vector with actual sensation votes

lsCond <- as.list(data.frame(ta,tr,vel,rh,clo,met,asv))

## Calculate coefficient asCoeff for data set
asCoeff <- calcasCoeff(lsCond)

## calculate ptsa
ptsa <- NULL
for (i in 1:length(ta)){
ptsa[i] <- calcPtsa(ta[i], tr[i], vel[i], rh[i], clo[i], met[i], asCoeff = asCoeff)$ptsa
}
ptsa




