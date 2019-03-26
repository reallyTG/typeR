library(pdfCluster)


### Name: dbs-class
### Title: Class "dbs"
### Aliases: dbs-class summary.dbs show,dbs-method
### Keywords: classes cluster

### ** Examples

showClass("dbs")

#wine example
#data loading
data(wine)

# select a subset of variables
x <- wine[, c(2,5,8)]

#clustering
cl <- pdfCluster(x)
 
dsil <- dbs(cl)
dsil
summary(dsil)



