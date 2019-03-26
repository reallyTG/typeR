library(mixtox)


### Name: BMD
### Title: Calculating benchmark dose (BMD) and lower limit of benchmark
###   dose (BMDL)
### Aliases: BMD
### Keywords: BMD BMDL

### ** Examples

## example 1
# calcualte the BMD of heavy metal Ni(2+) on the MCF-7 cells 
x <- cytotox$Ni$x
rspn <- cytotox$Ni$y
obj <- curveFit(x, rspn, eq = 'Logit', param = c(12, 3), effv = c(0.05, 0.5), rtype = 'quantal')
BMD(obj, bmr = 0.10, backg = 0, def = 'additional', eq = 'default', sigLev = 0.05, ci = 'CI')



