library(gCat)


### Name: gcat.test
### Title: Graph-based two-sample tests for categorical data
### Aliases: gcat.test

### ** Examples

data(Example)
gcat.test(mycounts,mydist,myedge,method=c("aMST","C-uMST","uMST","C-uNNB","RC0","TC0"),Nperm=1000)
gcat.test(mycounts,mydist,method=c("C-uMST","uMST"))
gcat.test(mycounts,mydist)
gcat.test(mycounts,myedge,method="RC0")



