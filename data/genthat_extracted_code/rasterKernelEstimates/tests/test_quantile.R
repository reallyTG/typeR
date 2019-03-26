library(rasterKernelEstimates)

set.seed(100)

cmdArgs <- commandArgs(trailingOnly = TRUE)
if( !('n' %in% ls() ))n=as.numeric(cmdArgs[1])
if( !('m' %in% ls() ))m=as.numeric(cmdArgs[2])

# check if we got something
if(is.na(n)) n <- 50 
if(is.na(m)) m <- 9 

print(n)
print(m)

# create a raster object with extreme values
r <- raster::raster( matrix(rcauchy(n^2),n,n))

# create a weight matrix
W <- matrix(1,nrow=m,ncol=m)

# calculate local median
run.time <- proc.time()
rLocalKDE1 <- rasterLocalQuantiles(r,W,q=30)
print(proc.time() - run.time)

# calculate the local median using focal
run.time <- proc.time()
rLocalKDE2 <- raster::focal( r, W, pad=TRUE, fun=function(x) stats::quantile(x,probs=0.3,na.rm=T,type=1), padValue=NA)
print(proc.time() - run.time)

print( sprintf( "The maximum absolute difference = %f.", max(abs(raster::values(rLocalKDE1) - raster::values(rLocalKDE2)),na.rm = T)))




