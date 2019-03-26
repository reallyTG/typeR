library(mra)


### Name: plot.cjs
### Title: Plot CJS Model
### Aliases: plot.cjs
### Keywords: models

### ** Examples
 
data(dipper.histories)
xy <- F.cjs.covars( nrow(dipper.histories), ncol(dipper.histories) )
for(j in 1:ncol(dipper.histories)){ assign(paste("x",j,sep=""), xy$x[,,j]) }
dipper.cjs <- F.cjs.estim( ~x2+x3+x4+x5+x6, ~x1+x2+x3+x4+x5, dipper.histories )
plot(dipper.cjs)
print(dipper.cjs$s.hat)
plot(dipper.cjs, type="s", animals=1)
 


