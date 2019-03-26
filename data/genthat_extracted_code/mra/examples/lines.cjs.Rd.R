library(mra)


### Name: lines.cjs
### Title: lines.cjs
### Aliases: lines.cjs
### Keywords: models

### ** Examples


data(dipper.histories)
xy <- F.cjs.covars( nrow(dipper.histories), ncol(dipper.histories) )
for(j in 1:ncol(dipper.histories)){ assign(paste("x",j,sep=""), xy$x[,,j]) } 

# Fit constant capture probability, period (i.e., flood) effects on survival
dipper.cjs <- F.cjs.estim( ~1, ~x2+x3, dipper.histories )  

plot(dipper.cjs, type="s", animals=1)
lines(dipper.cjs, what="s", animals=c(4, 10))




