library(spam)


### Name: display
### Title: Graphially Represent the Nonzero Entries
### Aliases: display display.spam display,spam-method
### Keywords: hplot

### ** Examples

set.seed(13)

nz <- 8
ln <- nz
smat <- spam(0, ln, ln)
smat[cbind(sample(ln, nz), sample(ln, nz))] <- 1:nz

par(mfcol=c(1,2), pty='s')
options(spam.imagesize = 1000)
display(smat)
options(spam.imagesize = 10)
display(smat)


# very large but very sparse matrix
nz <- 128
ln <- nz^2
smat <- spam(0, ln, ln)
smat[cbind(sample(ln, nz), sample(ln, nz))] <- 1:nz

par(mfcol=c(1, 1), pty='s')
display(smat, cex = 100)




