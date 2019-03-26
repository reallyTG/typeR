library(quantable)


### Name: imageWithLabels
### Title: image plot with labels
### Aliases: imageWithLabels

### ** Examples

x = matrix(rnorm(20*30),ncol=20)
rownames(x) <- 1:30
colnames(x) <- letters[1:20]
martmp <- par()$mar
imageWithLabels(x)
imageWithLabels(x,marLeft = c(5,5,2,2),marRight=c(0,0,0,0),xlab="ttt",ylab="bbb")
par(mar = martmp)




