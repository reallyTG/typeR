library(BlockCov)


### Name: Simu_Sigma
### Title: This function generates a block structured symmetric positive
###   definite matrix to test the BlockCov methodology.
### Aliases: Simu_Sigma

### ** Examples

Sigma <- Simu_Sigma(q = 100, diag = FALSE, equal = TRUE)
Matrix::image(Sigma)



