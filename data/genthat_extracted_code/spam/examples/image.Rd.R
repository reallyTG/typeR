library(spam)


### Name: image
### Title: Display a spam Object as Color Image
### Aliases: image.spam image.spam.chol image,spam-method
### Keywords: hplot

### ** Examples

set.seed(13)
nz <- 8
ln <- nz
smat <- spam(0, ln, ln)
smat[ cbind(sample(ln,nz), sample(ln,nz))] <- 1:nz

par(mfcol=c(1,2),pty='s')
options(spam.imagesize=1000)
image(smat) # better: col=tim.colors(nz))
options(spam.imagesize=10)
image(smat) # better: col=tim.colors(nz))


nz <- 128
ln <- nz^2
smat <- spam(0,ln,ln)
smat[cbind(sample(ln,nz), sample(ln,nz))] <- 1:nz

par(mfcol=c(1,1), pty='s')
image(smat,cex=100) # better:, col=tim.colors(nz))




