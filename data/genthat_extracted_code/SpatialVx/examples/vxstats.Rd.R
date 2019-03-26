library(SpatialVx)


### Name: vxstats
### Title: Some Common Traditional Forecast Verification Statistics.
### Aliases: vxstats
### Keywords: math

### ** Examples

# Calculate the traditional verification scores for the first geometric case
# of the ICP.
data( "geom001" )
data( "geom000" )

rmse <- sqrt(vxstats( geom001, geom000, which.stats="mse")$mse)
rmse
vxstats( geom001 > 0, geom000 > 0, which.stats=c("bias", "ts", "ets", "pod", "far", "f", "hk"))

data( "geom005" )
vxstats( geom005 > 0, geom000 >0, which.stats=c("ts","ets","bcts","bcets"))



