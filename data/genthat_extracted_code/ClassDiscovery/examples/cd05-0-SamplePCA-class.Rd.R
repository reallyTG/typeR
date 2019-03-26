library(ClassDiscovery)


### Name: SamplePCA
### Title: Class "SamplePCA"
### Aliases: SamplePCA SamplePCA-class plot,SamplePCA,missing-method
###   predict,SamplePCA-method screeplot,SamplePCA-method
###   summary,SamplePCA-method identify,SamplePCA-method
###   text,SamplePCA-method
### Keywords: classes array algebra multivariate

### ** Examples

showClass("SamplePCA")

## simulate data from three different groups
d1 <- matrix(rnorm(100*10, rnorm(100, 0.5)), nrow=100, ncol=10, byrow=FALSE)
d2 <- matrix(rnorm(100*10, rnorm(100, 0.5)), nrow=100, ncol=10, byrow=FALSE)
d3 <- matrix(rnorm(100*10, rnorm(100, 0.5)), nrow=100, ncol=10, byrow=FALSE)
dd <- cbind(d1, d2, d3)
kind <- factor(rep(c('red', 'green', 'blue'), each=10))
colnames(dd) <- paste(kind, rep(1:10, 3), sep='')

## perform PCA
spc <- SamplePCA(dd, splitter=kind)

## plot the results
plot(spc, col=levels(kind))

## mark the group centers
x1 <- predict(spc, matrix(apply(d1, 1, mean), ncol=1))
points(x1[1], x1[2], col='red', cex=2)
x2 <- predict(spc, matrix(apply(d2, 1, mean), ncol=1))
points(x2[1], x2[2], col='green', cex=2)
x3 <- predict(spc, matrix(apply(d3, 1, mean), ncol=1))
points(x3[1], x3[2], col='blue', cex=2)

## check out the variances
screeplot(spc)

## cleanup
rm(d1, d2, d3, dd,kind, spc, x1, x2, x3)



