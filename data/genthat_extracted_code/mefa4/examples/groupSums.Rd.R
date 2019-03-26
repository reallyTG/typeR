library(mefa4)


### Name: groupSums
### Title: Compute Summary Statistics of Data Subsets
### Aliases: sum_by groupSums groupSums,matrix-method
###   groupSums,sparseMatrix-method groupSums,Mefa-method groupMeans
###   groupMeans,matrix-method groupMeans,sparseMatrix-method
###   groupMeans,Mefa-method
### Keywords: manip methods

### ** Examples

x <- data.frame(
    sample = paste("Sample", c(1,1,2,2,3,4), sep="."),
    species = c(paste("Species", c(1,1,1,2,3), sep="."), 
    "zero.pseudo"), count = c(1,2,10,3,4,0))
samp <- data.frame(samples=levels(x$sample), var1=1:2)
taxa <- data.frame(specnames=levels(x$species), var2=c("b","a"))
rownames(samp) <- samp$samples
rownames(taxa) <- taxa$specnames
x2 <- Xtab(count ~ sample + species, x, cdrop=FALSE,rdrop=TRUE)
x5 <- Mefa(x2, samp, taxa, join="inner")

groupSums(as.matrix(x2), 1, c(1,1,2))
groupSums(as.matrix(x2), 2, c(1,1,2,2))
groupSums(x2, 1, c(1,1,2))
groupSums(x2, 2, c(1,1,2,2))
groupSums(x5, 1, c(1,1,2))
groupSums(x5, 2, c(1,1,2,2))

groupMeans(as.matrix(x2), 1, c(1,1,2))
groupMeans(as.matrix(x2), 2, c(1,1,2,2))
groupMeans(x2, 1, c(1,1,2))
groupMeans(x2, 2, c(1,1,2,2))
groupMeans(x5, 1, c(1,1,2))
groupMeans(x5, 2, c(1,1,2,2))

sum_by(runif(100, 0, 1), sample(LETTERS[1:4], 100, replace=TRUE))



