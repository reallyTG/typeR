library(dbstats)


### Name: dbplsr
### Title: Distance-based partial least squares regression
### Aliases: dbplsr dbplsr.formula dbplsr.dist dbplsr.D2 dbplsr.Gram
###   print.dbplsr

### ** Examples

#require(pls)
library(pls)
data(yarn)
## Default methods:
yarn.dbplsr <- dbplsr(density ~ NIR, data = yarn, ncomp=6, method="GCV")





