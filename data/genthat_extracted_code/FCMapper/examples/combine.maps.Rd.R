library(FCMapper)


### Name: combine.maps
### Title: Map aggregator
### Aliases: combine.maps

### ** Examples

#Matrix 1
matrix = matrix(nrow=7,ncol=7)
matrix[1,] = c(0,-0.5,0,0,1,0,1)
matrix[2,] = c(1,0,1,0.2,0,0,0.6)
matrix[3,] = c(0,1,0,0,0,0,0)
matrix[4,] = c(0.6,0,0,1,0,0,0.1)
matrix[5,] = c(0,0.5,0,0,1,0,-0.6) 
matrix[6,] = c(0,0,-1,0,0,0,0)
matrix[7,] = c(0,0,0,-0.5,0,0,1)
concept.names = c("A","B","C","D","E","F","G")

#Matrix 2
matrix2 = matrix(nrow=6,ncol=6)
matrix2[1,] = c(0,1,0,1,0,0)
matrix2[2,] = c(-1,1,0,-1,0,1)
matrix2[3,] = c(0,0,1,0,0,1)
matrix2[4,] = c(-1,0,0,0,0,0)
matrix2[5,] = c(0,0.5,0,0,1,0) 
matrix2[6,] = c(1,0,0,-1,0,0)
concept.names2 = c("E","F","G","H","I","J")

#Aggregate
combine.maps(matrix1=matrix,matrix2=matrix2,concept.names1=
concept.names,concept.names2=concept.names2)




