library(mra)


### Name: F.cjs.covars
### Title: F.cjs.covars
### Aliases: F.cjs.covars
### Keywords: models

### ** Examples

##  Fit CJS model to dipper data, time-varying capture and survivals.
data(dipper.histories)
xy <- F.cjs.covars( nrow(dipper.histories), ncol(dipper.histories) )
dipper.cjs <- F.cjs.estim( capture=~xy$x[,,2]+xy$x[,,3]+xy$x[,,4]+xy$x[,,5]+xy$x[,,6], 
	survival=~xy$x[,,1]+xy$x[,,2]+xy$x[,,3]+xy$x[,,4]+xy$x[,,5], dipper.histories )
print(dipper.cjs)




