library(quantable)


### Name: onesamplegreaterT
### Title: One sample single sided t-test on matrix
### Aliases: onesamplegreaterT

### ** Examples


data <- matrix(rnorm(100,1,1), ncol=5)
dim(data)
rownames(data) <- 1:20
onesamplegreaterT(data)




