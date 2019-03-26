library(BaTFLED3D)


### Name: input_data
### Title: Object storing input data for BaTFLED algorithm with 3-D
###   response tensor.
### Aliases: input_data
### Keywords: datasets

### ** Examples

a <- input_data$new(mode1.X = matrix(rnorm(30), nrow=3, ncol=10),
                    mode2.X = matrix(rnorm(36), nrow=4, ncol=9), 
                    mode3.X = matrix(rnorm(40), nrow=5, ncol=8),
                    resp = array(rnorm(60), dim=c(3,4,5)))
im_mat(a$mode1.X)
im_mat(a$mode2.X)
im_mat(a$mode3.X)
im_mat(a$resp[,,1])



