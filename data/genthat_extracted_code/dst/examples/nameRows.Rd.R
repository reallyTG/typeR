library(dst)


### Name: nameRows
### Title: Using the column names of a matrix to construct names for the
###   rows
### Aliases: nameRows

### ** Examples

f <- matrix(c(0,0,0,1,0,0,0,0,1,1,0,1,1,1,1),ncol=3, byrow = TRUE)
colnames(f) <- c("A","B","C")
rownames(f) <-nameRows(f)
f
f2 <- matrix(c(0,0,0,1,0,0,0,0,1,1,0,1),ncol=3, byrow = TRUE)
colnames(f2) <- c("A2","B2","C2")
rownames(f2) <-nameRows(f2) 
f2



