library(FDboost)


### Name: hmatrix
### Title: A S3 class for univariate functional data on a common grid
### Aliases: hmatrix

### ** Examples

## Example for a hmatrix object
t1 <- rep((1:5)/2, each = 3)
id1 <- rep(1:3, 5)
x1 <- matrix(1:15, ncol = 5) 
s1 <- (1:5)/2 
myhmatrix <- hmatrix(time = t1, id = id1, x = x1, argvals = s1, 
                     timeLab = "t1", argvalsLab = "s1", xLab = "test")

# extract with [ keeps attributes 
# select observations of subjects 2 and 3
myhmatrixSub <- myhmatrix[id1 %in% c(2, 3), ]  
str(myhmatrixSub)
getX(myhmatrixSub)
getX(myhmatrix)

# get time
myhmatrix[ , 1] # as column matrix as drop = FALSE
getTime(myhmatrix) # as vector

# get id
myhmatrix[ , 2] # as column matrix as drop = FALSE
getId(myhmatrix) # as vector

# subset hmatrix on the basis of an index, which is defined on the curve level
reweightData(data = list(hmat = myhmatrix), vars = "hmat", index = c(1, 1, 2))
# this keeps only the unique x values in attr(,'x') but multiplies the corresponding
# ids and times in the time id matrix 
# for bhistx baselearner, there may be an additional id variable for the tensor product
newdat <- reweightData(data = list(hmat = myhmatrix, 
  repIDx = rep(1:nrow(attr(myhmatrix,'x')), length(attr(myhmatrix,"argvals")))), 
  vars = "hmat", index = c(1,1,2), idvars="repIDx")
length(newdat$repIDx) 

## use hmatrix within a data.frame
mydat <- data.frame(I(myhmatrix), z=rnorm(3)[id1])
str(mydat)
str(mydat[id1 %in% c(2, 3), ])
str(myhmatrix[id1 %in% c(2, 3), ])
 



