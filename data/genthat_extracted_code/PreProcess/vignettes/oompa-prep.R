### R code from vignette source 'oompa-prep.Rnw'

###################################################
### code chunk number 1: load
###################################################
library(PreProcess)


###################################################
### code chunk number 2: mat
###################################################
mat <- matrix(1:12, 3, 4)
mat


###################################################
### code chunk number 3: lr
###################################################
fliplr(mat)


###################################################
### code chunk number 4: ud
###################################################
flipud(mat)


###################################################
### code chunk number 5: rot
###################################################
flipud(fliplr(mat))


###################################################
### code chunk number 6: elli
###################################################
x <- rnorm(1000, 1, 2)
y <- rnorm(1000, 1, 2)
plot(x,y)
ellipse(1, 1, col="red", type='l', lwd=2)
ellipse(3, 2, col="green", type='l', lwd=2)
ellipse(3, 2, x0=2, y0=2, col="blue", type='l', lwd=2)


###################################################
### code chunk number 7: xyz
###################################################
x <- rnorm(30)
y <-  x + rnorm(30, sd=0.1)
z <- 3 + 2*x + rnorm(30, sd=0.1)


###################################################
### code chunk number 8: cord
###################################################
cor(x, y)
cor(x, z)
cor(y, z)


###################################################
### code chunk number 9: cord
###################################################
f.cord(x, y)
f.cord(x, z)
f.cord(y, z)


###################################################
### code chunk number 10: chan
###################################################
nc <- 100
nr <- 100
v <- rexp(nc*nr, 1/1000)
b <- rnorm(nc*nr, 80, 10)
s <- sapply(v-b, max, 1)
ct <- ChannelType('user', 'random', nc, nr,  'fake')
subbed <- Channel(name='fraud', parent='', type=ct, vec=s)
rm(ct, nc, nr, v, b, s)		# clean some stuff
summary(subbed)


###################################################
### code chunk number 11: pipe
###################################################
processed <- process(subbed, PIPELINE.STANDARD)
summary(processed)


