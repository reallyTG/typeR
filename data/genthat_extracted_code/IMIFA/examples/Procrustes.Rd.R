library(IMIFA)


### Name: Procrustes
### Title: Procrustes Transformation
### Aliases: Procrustes
### Keywords: utility

### ** Examples

# Match two matrices, allowing translation and dilation
mat1     <- diag(rnorm(10))
mat2     <- 0.05 * matrix(rnorm(100), 10, 10) + mat1
proc     <- Procrustes(X=mat1, Xstar=mat2, translate=TRUE, dilate=TRUE, sumsq=TRUE)

# Extract the transformed matrix, rotation matrix, translation vector and scaling factor
mat_new  <- proc$X.new
mat_rot  <- proc$R
mat_t    <- proc$t
mat_d    <- proc$d

# Compare the sum of squared differences to a Procestean transformation with rotation only
mat_ss   <- proc$ss
mat_ss2  <- Procrustes(X=mat1, Xstar=mat2, sumsq=TRUE)$ss



