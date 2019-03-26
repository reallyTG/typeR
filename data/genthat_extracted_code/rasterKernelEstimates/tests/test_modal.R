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


# create a categorical raster
r <- raster::raster( matrix( sample(-4:4,size=n^2,replace=T),n,n))


# create a weight matrix
W <- matrix(1,m,m)

# calculate the weighted local mean and variance
run.time <- proc.time()
rLocalKDE1 <- rasterLocalCategoricalModes(r,W)
print(proc.time() - run.time)
