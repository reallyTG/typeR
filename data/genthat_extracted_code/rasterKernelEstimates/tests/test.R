library(rasterKernelEstimates)

set.seed(100)

cmdArgs <- commandArgs(trailingOnly = TRUE)
if( !('n' %in% ls() ))n=as.numeric(cmdArgs[1])
if( !('m' %in% ls() ))m=as.numeric(cmdArgs[2])

# check if we got something
if(is.na(n)) n <-  50
if(is.na(m)) m <- 9 

print(n)
print(m)

# create a raster object
r <- raster::raster( matrix(rnorm(n^2),n,n))

print( format(object.size(r), units = "auto")) 

# create a weight matrix
W <-  matrix(1/m^2,m,m )

# apply the weight with rasterKernelEstimates
run.time <- proc.time()
rLocalKDE1 <- rasterLocalSums(r,W)
print(proc.time() - run.time)

run.time <- proc.time()
rLocalKDE2 <- raster::focal(r,W,pad=TRUE)
print(proc.time() - run.time)

# print out the max abs difference
print(
sprintf(
"The maximum absolute difference = %f.",
max(abs(raster::values(rLocalKDE1) - raster::values(rLocalKDE2)
),na.rm = T))
)
