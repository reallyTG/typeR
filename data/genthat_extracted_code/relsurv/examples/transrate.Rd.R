library(relsurv)


### Name: transrate
### Title: Reorganize Data into a Ratetable Object
### Aliases: transrate
### Keywords: survival

### ** Examples

men <- cbind(exp(-365.241*exp(-14.5+.08*(0:100))),exp(-365*exp(-14.7+.085*(0:100))))
women <- cbind(exp(-365.241*exp(-15.5+.085*(0:100))),exp(-365*exp(-15.7+.09*(0:100))))
table <- transrate(men,women,yearlim=c(1980,1990),int.length=10)



