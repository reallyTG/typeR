library(FCMapper)


### Name: check.matrix
### Title: Matrix validation
### Aliases: check.matrix

### ** Examples


#Is not square and contains values outside of -1 and 1: 
matrix = matrix(nrow=7,ncol=7)
matrix[1,] = c(0,-0.5,0,0,1,0,1)
matrix[2,] = c(1,0,1,0.2,0,0,0.6)
matrix[3,] = c(0,1,0,0,0,2,0)
matrix[4,] = c(0.6,0,0,1,0,0,0.1)
matrix[5,] = c(-5,0.5,0,0,1,0,-0.6) 
matrix[6,] = c(0,0,-1,0,0,0,0)

#Check
check.matrix(matrix)

#Matrix without issues:
matrix2 = matrix(nrow=7,ncol=7)
matrix2[1,] = c(0,-0.5,0,0,1,0,1)
matrix2[2,] = c(1,0,1,0.2,0,0,0.6)
matrix2[3,] = c(0,1,0,0,0,0,0)
matrix2[4,] = c(0.6,0,0,1,0,0,0.1)
matrix2[5,] = c(0,0.5,0,0,1,0,-0.6) 
matrix2[6,] = c(0,0,-1,0,0,0,0)
matrix2[7,] = c(0,0,0,-0.5,0,0,1)

#Check
check.matrix(matrix2)



