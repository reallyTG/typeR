library(TooManyCellsR)


### Name: writeMatrixFiles
### Title: Write a Matrix to a folder.
### Aliases: writeMatrixFiles

### ** Examples

input <- system.file("extdata", "mat.csv", package="TooManyCellsR")
df = read.csv(input, row.names = 1, header = TRUE)
mat = Matrix::Matrix(as.matrix(df), sparse = TRUE)
writeMatrixFiles(mat)



