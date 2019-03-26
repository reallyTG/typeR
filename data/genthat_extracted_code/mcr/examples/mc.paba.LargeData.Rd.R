library(mcr)


### Name: mc.paba.LargeData
### Title: Passing-Bablok Regression for Large Datasets
### Aliases: mc.paba.LargeData

### ** Examples

library("mcr")
 data(creatinine,package="mcr")

# remove any NAs
crea <- na.omit(creatinine)

# call the approximative Passing-Bablok algorithm (Default NBins=1e06)
res1 <- mcreg(x=crea[,1], y=crea[,2], method.reg="PaBaLarge", method.ci="analytical")
getCoefficients(res1)

# now increase the number of bins and see whether this makes a difference
res2 <- mcreg(x=crea[,1], y=crea[,2], method.reg="PaBaLarge", method.ci="analytical", NBins=1e07)
getCoefficients(res2)
getCoefficients(res1)-getCoefficients(res2)



