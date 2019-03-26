library(fDMA)


### Name: normalize
### Title: Normalizes a Numeric Matrix by Columns.
### Aliases: normalize

### ** Examples

wti <- crudeoil[-1,1]
drivers <- (lag(crudeoil[,-1],k=1))[-1,]

nwti <- normalize(wti)

nd <- normalize(drivers)

normalize(cbind(c(0,1,2),c(1,2,3),c(0,1,3)))



