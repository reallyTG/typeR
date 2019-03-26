library(MFT)


### Name: MFT.mean
### Title: MFT.mean
### Aliases: MFT.mean

### ** Examples

# Normal distributed sequence with 3 change points of the mean (at n=100, 155, 350)
set.seed(50)
X1   <- rnorm(400,0,1); X2 <- rnorm(400,3,1); X3 <- rnorm(400,5,1); X4 <- rnorm(600,4.6,1)
X    <- c(X1[1:100],X2[101:155],X3[156:350],X4[351:600])
mft  <- MFT.mean(X)
plot(mft)
# Set additional parameters (window set)
mft2 <- MFT.mean(X,autoset.H=FALSE,H=c(80,160,240))
plot(mft2)





