library(OpenImageR)


### Name: convolution
### Title: convolution
### Aliases: convolution

### ** Examples



# kernel
x = matrix(1, nrow = 4, ncol = 4) / 16   # uniform


# matrix
image_matrix = matrix(runif(100), 10, 10)

res = convolution(image_matrix, x, "same")


# array
image_array = array(runif(100), dim = c(10, 10, 3))

res = convolution(image_array, x, "same")




