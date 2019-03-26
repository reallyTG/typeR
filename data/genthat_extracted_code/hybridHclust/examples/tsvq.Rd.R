library(hybridHclust)


### Name: tsvq
### Title: Tree Structured Vector Quantization
### Aliases: tsvq tsvq2hclust
### Keywords: cluster

### ** Examples

x <- cbind(c(-1.4806,1.5772,-0.9567,-0.92,-1.9976,-0.2723,-0.3153),
c( -0.6283,-0.1065,0.428,-0.7777,-1.2939,-0.7796,0.012))
t1 <- tsvq(x)
par(mfrow=c(1,2))
plot(x,pch=as.character(1:nrow(x)),asp=1)
plot(t1)
cbind(x,cutree(t1,2))
# below also works although you don't need to do it this way.
t2 <- tsvq(x,as.hclust=FALSE)
t2 <- tsvq2hclust(t2)



