library(pdfCluster)


### Name: pdfClassification
### Title: Classification of low density data
### Aliases: pdfClassification
### Keywords: cluster

### ** Examples

# load data
data(wine)

# select a subset of variables
x <- wine[, c(2,5,8)]

#whole procedure, included the classification phase
cl <- pdfCluster(x)
summary(cl)
table(groups(cl))

#use of bandwidths specific for the group 
cl1 <- pdfClassification(cl, hcores= TRUE)
table(groups(cl1))



