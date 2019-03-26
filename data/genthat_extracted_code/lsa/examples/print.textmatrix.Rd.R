library(lsa)


### Name: print.textmatrix
### Title: Print a textmatrix (Matrices)
### Aliases: print.textmatrix
### Keywords: array

### ** Examples


# fake a matrix
m = matrix(ncol=800, nrow=400)
m[1:length(m)] = 1:length(m)
colnames(m) = paste("D",1:ncol(m),sep="")
rownames(m) = paste("W",1:nrow(m),sep="")
class(m) = "textmatrix"

# show a short form of the matrix
print(m, bag_cols=5)




