library(oppr)


### Name: matrix_parameters
### Title: Matrix parameters
### Aliases: matrix_parameters numeric_matrix_parameter
###   binary_matrix_parameter

### ** Examples

# create matrix
m <- matrix(runif(9), ncol = 3)
colnames(m) <- letters[1:3]
rownames(m) <- letters[1:3]

# create a numeric matrix parameter
p1 <- numeric_matrix_parameter("m", m)
print(p1) # print it
p1$get() # get value
p1$id # get id
p1$validate(m[, -1]) # check if parameter can be updated
p1$set(m + 1) # set parameter to new values
p1$print() # print it again

# create a binary matrix parameter
m <- matrix(round(runif(9)), ncol = 3)
colnames(m) <- letters[1:3]
rownames(m) <- letters[1:3]

# create a binary matrix parameter
p2 <- binary_matrix_parameter("m", m)
print(p2) # print it
p2$get() # get value
p2$id # get id
p2$validate(m[, -1]) # check if parameter can be updated
p2$set(m + 1) # set parameter to new values
p2$print() # print it again



