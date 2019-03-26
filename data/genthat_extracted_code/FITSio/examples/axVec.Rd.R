library(FITSio)


### Name: axVec
### Title: Generate axis vector for image
### Aliases: axVec
### Keywords: file

### ** Examples

require(FITSio)
Z <- matrix(1:15, ncol = 3)
writeFITSim(Z, file = 'test.fits', c1 = 'Test FITS file',
            crpix = c(1,1), crvaln = c(10, 100), cdeltn = c(8, 2),
            ctypen = c('Distance', 'Time'),
            cunitn = c('Furlongs', 'Fortnights'))
X <-  readFITS('test.fits')
ax1 <- axVec(1, X$axDat)
ax2 <- axVec(2, X$axDat)
xlab <- X$axDat$ctype[1]
ylab <- paste(X$axDat$ctype[2], " [", X$axDat$cunit[2], "]", sep = "")
image(ax1, ax2, X$imDat, xlab = xlab, ylab = ylab)
unlink("test.fits")



