library(raster)


### Name: calc
### Title: Calculate
### Aliases: calc calc,Raster,function-method
### Keywords: methods spatial

### ** Examples

r <- raster(ncols=36, nrows=18)
r[] <- 1:ncell(r)

# multiply values with 10
fun <- function(x) { x * 10 }
rc1 <- calc(r, fun)

# set values below 100 to NA. 
fun <- function(x) { x[x<100] <- NA; return(x) }
rc2 <- calc(r, fun)

# set NA values to -9999
fun <- function(x) { x[is.na(x)] <- -9999; return(x)} 
rc3 <- calc(rc2, fun)

# using a RasterStack as input
s <- stack(r, r*2, sqrt(r))
# return a RasterLayer
rs1 <- calc(s, sum)

# return a RasterBrick
rs2 <- calc(s, fun=function(x){x * 10})
# recycling by layer
rs3 <- calc(s, fun=function(x){x * c(1, 5, 10)})

# use overlay when you want to refer to individual layer in the function
# but it can be done with calc: 
rs4 <- calc(s, fun=function(x){x[1]+x[2]*x[3]})

## 
# Some regression examples
## 

# create data
r <- raster(nrow=10, ncol=10)
s1 <- lapply(1:12, function(i) setValues(r, rnorm(ncell(r), i, 3)))
s2 <- lapply(1:12, function(i) setValues(r, rnorm(ncell(r), i, 3)))
s1 <- stack(s1)
s2 <- stack(s2)

# regression of values in one brick (or stack) with another
s <- stack(s1, s2)
# s1 and s2 have 12 layers; coefficients[2] is the slope
fun <- function(x) { lm(x[1:12] ~ x[13:24])$coefficients[2] }
x1 <- calc(s, fun)

# regression of values in one brick (or stack) with 'time'
time <- 1:nlayers(s)
fun <- function(x) { lm(x ~ time)$coefficients[2] }
x2 <- calc(s, fun)

# get multiple layers, e.g. the slope _and_ intercept
fun <- function(x) { lm(x ~ time)$coefficients }
x3 <- calc(s, fun)


### A much (> 100 times) faster approach is to directly use 
### linear algebra and pre-compute some constants

## add 1 for a model with an intercept
X <- cbind(1, time)

## pre-computing constant part of least squares
invXtX <- solve(t(X) %*% X) %*% t(X)

## much reduced regression model; [2] is to get the slope
quickfun <- function(y) (invXtX %*% y)[2]
x4 <- calc(s, quickfun) 



