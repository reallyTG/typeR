library(mra)


### Name: residuals.cjs
### Title: Residuals for CJS Model
### Aliases: residuals.cjs
### Keywords: survival models

### ** Examples


# Fit CJS model to dipper data, time-varying capture and survivals.
data(dipper.histories)
xy <- F.cjs.covars( nrow(dipper.histories), ncol(dipper.histories) )
for(j in 1:ncol(dipper.histories)){ assign(paste("x",j,sep=""), xy$x[,,j]) } 
dipper.cjs <- F.cjs.estim( ~x2+x3+x4+x5+x6, ~x1+x2+x3+x4+x5, dipper.histories )
residuals(dipper.cjs)




