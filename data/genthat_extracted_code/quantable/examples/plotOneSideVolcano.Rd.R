library(quantable)


### Name: plotOneSideVolcano
### Title: Plot and filter data coming from one sample single sided t-test
### Aliases: plotOneSideVolcano

### ** Examples


data <- matrix(rnorm(100,1,1), ncol=5)
dim(data)
rownames(data) <- 1:20
resM <- onesamplegreaterT(data)
plotOneSideVolcano(resM)
data <- matrix(rnorm(100,2,1), ncol=5)
dim(data)
rownames(data) <- 1:20
resM <- onesamplegreaterT(data)
plotOneSideVolcano(resM)



