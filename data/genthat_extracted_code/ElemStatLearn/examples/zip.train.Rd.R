library(ElemStatLearn)


### Name: zip.train
### Title: Handwritten Digit Recognition Data
### Aliases: zip.train
### Keywords: datasets

### ** Examples

findRows <- function(zip, n) {
 # Find  n (random) rows with zip representing 0,1,2,...,9
 res <- vector(length=10, mode="list")
 names(res) <- 0:9
 ind <- zip[,1]
 for (j in 0:9) {
    res[[j+1]] <- sample( which(ind==j), n ) }
 return(res) }

# Making a plot like that on page 4:

digits <- vector(length=10, mode="list")
names(digits) <- 0:9
rows <- findRows(zip.train, 6)
for (j in 0:9) {
    digits[[j+1]] <- do.call("cbind", lapply(as.list(rows[[j+1]]), 
                       function(x) zip2image(zip.train, x)) )
}
im <- do.call("rbind", digits)
image(im, col=gray(256:0/256), zlim=c(0,1), xlab="", ylab="" )    



