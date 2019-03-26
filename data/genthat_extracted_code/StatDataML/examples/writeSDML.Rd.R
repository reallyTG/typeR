library(StatDataML)


### Name: writeSDML
### Title: Write Data in StatDataML Format
### Aliases: writeSDML
### Keywords: file

### ** Examples

A <- matrix(1:16, ncol=4)
rownames(A) <- paste("row", 1:4, sep="")
colnames(A) <- paste("col", 1:4, sep="")
writeSDML(A, "testmat.sdml")

I <- letters[1:16]
attr(A, "info") <- I
writeSDML(A, "testmat2.sdml", textdata = FALSE)



