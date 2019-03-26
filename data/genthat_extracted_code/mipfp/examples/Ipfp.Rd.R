library(mipfp)


### Name: Ipfp
### Title: Multidimensional Iterative Proportional Fitting
### Aliases: Ipfp
### Keywords: models multivariate array

### ** Examples

# Example 1: 2-way table (V1,V2) of dim=(2,2)
# generating an intial 2-way table to be updated
seed.2d <- array(1,dim=c(2,2))
# desired targets (margins) : V1 and V2
target.row <- c(50,50)
target.col <- c(30,70)
# storing the margins in a list
tgt.data.2d <- list(target.col, target.row)
# list of dimensions of each marginal constrain
tgt.list.2d <- list(1,2)
# calling the Ipfp function
res.2d <- Ipfp(seed.2d, tgt.list.2d, tgt.data.2d)

# Example 2: 3-way table (V1,V2,V3) of dim=(2,4,2)
# seed
seed.3d <- array(1,c(2,4,2))
seed.3d[1,1,1] <- 4
seed.3d[1,3,1] <- 10
seed.3d[1,4,2] <- 6
# desired targets (margins) : V1 and (V2,V3)
target.V1 <- c(50, 16)
target.V2.V3 <- array(4, dim=c(4,2))
target.V2.V3[1,1] <- 10
target.V2.V3[3,1] <- 22
target.V2.V3[4,2] <- 14
# list of dimensions of each marginal constrain
tgt.data.3d <- list(target.V1, target.V2.V3)
# storing the description of target data in a list
tgt.list.3d <- list( 1, c(2,3) )
# calling the Ipfp function
res.3d <- Ipfp(seed.3d, tgt.list.3d, tgt.data.3d, iter=50, print=TRUE, tol=1e-5)

# Example 3: 2-way table (V1,V2) of dim=(2,3) with missing values in the targets
# generating an intial 2-way table to be updated
seed.2d.na <- array(1,dim=c(2,3))
# desired targets (margins) : V1 and V2
target.row.na <- c(40,60)
target.col.na <- c(NA,10,NA)
# storing the margins in a list
tgt.data.2d.na <- list(target.row.na, target.col.na)
# storing the description of target data in a list
tgt.list.2d.na <- list(1,2)
# calling the Ipfp function
res.2d.na <- Ipfp(seed.2d.na, tgt.list.2d.na, tgt.data.2d.na, na.target=TRUE)



