library(VGAM)


### Name: iam
### Title: Index from Array to Matrix
### Aliases: iam
### Keywords: manip programming

### ** Examples

iam(1, 2, M = 3)  # The 4th column represents element (1,2) of a 3x3 matrix
iam(NULL, NULL, M = 3, both = TRUE)  # Return the row and column indices

dirichlet()@weight

M <- 4
temp1 <- iam(NA, NA, M = M, both = TRUE)
mat1 <- matrix(NA, M, M)
mat1[cbind(temp1$row, temp1$col)] = 1:length(temp1$row)
mat1  # More commonly used

temp2 <- iam(NA, NA, M = M, both = TRUE, diag = FALSE)
mat2 <- matrix(NA, M, M)
mat2[cbind(temp2$row, temp2$col)] = 1:length(temp2$row)
mat2  # Rarely used



