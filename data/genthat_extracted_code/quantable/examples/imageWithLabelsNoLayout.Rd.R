library(quantable)


### Name: imageWithLabelsNoLayout
### Title: image plot with labels
### Aliases: imageWithLabelsNoLayout

### ** Examples

x = matrix(rnorm(20*30),ncol=20)
rownames(x) <- 1:30
colnames(x) <- letters[1:20]
quantable:::image_nan(x,textB=1)

imageWithLabelsNoLayout(x,col = heat.colors(13),textB=2, text.cex=0.6)
imageWithLabelsNoLayout(x,col = heat.colors(12),breaks=seq(min(x),max(x),length=13))
x[3,3] <- NA
imageWithLabelsNoLayout(x,col = heat.colors(12),
breaks=seq(min(x,na.rm=TRUE),
max(x,na.rm=TRUE),length=13))
imageWithLabelsNoLayout(x,xlab="ttt",ylab="bbb")
imageWithLabelsNoLayout(x,xlab="ttt",ylab="bbb", zlim=c(0,2))




