library(matrixLaplacian)


### Name: matrixLaplacian
### Title: Normalized Laplacian Matrix and Laplacian Map
### Aliases: matrixLaplacian

### ** Examples

#Create a square matrix
A <- matrix(c(1:16), 4, 4)
#Construct normalized Laplacian matrix and plot map
m <- matrixLaplacian(A, plot2D=TRUE, plot3D=TRUE)
#See the eigenvectors
vector<-m$eigenvector



