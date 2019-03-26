library(lsa)


### Name: summary.textmatrix
### Title: Summary of a textmatrix (Matrices)
### Aliases: summary.textmatrix
### Keywords: array

### ** Examples


# fake a matrix
m = matrix(ncol=800, nrow=400)
m[1:length(m)] = 1:length(m)
colnames(m) = paste("D",1:ncol(m),sep="")
rownames(m) = paste("W",1:nrow(m),sep="")
class(m) = "textmatrix"

# show a short form of the matrix
summary(m)




