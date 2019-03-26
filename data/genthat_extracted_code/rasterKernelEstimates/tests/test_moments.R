library(rasterKernelEstimates)

set.seed(100)

cmdArgs <- commandArgs(trailingOnly = TRUE)
if( !('n' %in% ls() ))n=as.numeric(cmdArgs[1])
if( !('m' %in% ls() ))m=as.numeric(cmdArgs[2])

# check if we got something
if(is.na(n)) n <- 6 
if(is.na(m)) m <- 5 

print(n)
print(m)

# create a raster object of two populations
r <- raster::raster( cbind( matrix(rnorm(n^2),n,n), matrix(rnorm(n^2,2,2),n,n)) ) 

# create a weight matrix
W <- matrix(1,nrow=m,ncol=m)

# calculate the weighted local mean and variance
run.time <- proc.time()
rLocalKDE1 <- rasterLocalMoments(r,W)
print(proc.time() - run.time)
