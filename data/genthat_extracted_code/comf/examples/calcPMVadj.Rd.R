library(comf)


### Name: calcpmvadj
### Title: Calculating Adjusted Predicted Mean Votes
### Aliases: calcpmvadj calcaPMV calcePMV pmvadj aPMV ePMV apmv epmv
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

## Calculate coefficient apCoeff for data set
apCoeff <- calcapCoeff(lsCond)

## calculate apmv
apmv <- NULL
for (i in 1:length(ta)){
apmv[i] <- calcaPMV(ta[i], tr[i], vel[i], rh[i], clo[i], met[i], apCoeff = apCoeff)$apmv
}
apmv




