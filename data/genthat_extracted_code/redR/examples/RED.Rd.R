library(redR)


### Name: RED
### Title: RED: Regularization by Denoising
### Aliases: RED RED-package RED

### ** Examples


im <- lenna
y <- degrade(im, noise = 0.05)
x <- RED(y, sigma = 1, lambda = 5, functional = 'DN', niter = 50)
par(mfrow = c(1,2), mar = c(0,0,2,0)+0.1)
plot(y, interp = FALSE, axes = FALSE, main = 'Degraded im')
mtext(paste(round(PSNR(im, y),2), 'dB'), side = 1, line = -2)
plot(x, interp = FALSE, axes = FALSE, main = 'Restored im')
mtext(paste(round(PSNR(im, x),2), 'dB'), side = 1, line = -2)

## Not run: 
##D im <- cameraman
##D y <- degrade(im, blur = 5)
##D y<- isoblur(im, 3, gaussian = TRUE)
##D x <- RED(y, sigma = 1, lambda = 4, functional = 'DB', niter = 1500)
##D par(mfrow = c(1,2), mar = c(0,0,2,0)+0.1)
##D plot(y, interp = FALSE, axes = FALSE, main = 'Degraded image')
##D mtext(paste(round(PSNR(im, y),2), 'dB'), side = 1, line = -2)
##D plot(x, interp = FALSE, axes = FALSE, main = 'Restored image')
##D mtext(paste(round(PSNR(im, x),2), 'dB'), side = 1, line = -2)
##D 
##D im <- cameraman
##D L = 2
##D s <- cbind(c(0,1,2,-2,1,3,-1,-3,-1), c(0,-1,2,1,-2,-3,3,-2,-3))
##D y <- degrade(im, L = L, s = s, noise = 0.05)
##D xref <- resize(imsplit(y,'z')[[1]], -100*L, -100*L, interpolation_type = 5)
##D x <- RED(y, sigma = 1, lambda = 5, functional = 'SR', niter = 50, args = list(scale = L, s=s))
##D par(mfrow = c(1,2), mar = c(0,0,2,0)+0.1)
##D plot(xref, interp = FALSE, axes = FALSE, main = 'Bicubic Interpolation')
##D mtext(paste(round(PSNR(im, xref),2), 'dB'), side = 1, line = -2)
##D plot(x, interp = FALSE, axes = FALSE, main = 'Super Resolved')
##D mtext(paste(round(PSNR(im, x),2), 'dB'), side = 1, line = -2)
##D 
##D im0 <- 0.2*pad(cameraman, 256, 'xy')
##D im1 <- lenna
##D im2 <- im1 - im0
##D y1 <- degrade(im1, noise = 0.05)
##D y2 <- degrade(im2, noise = 0.05)
##D y0 <- y1 - y2
##D x0 <- RED(y0, sigma = 1, lambda = 50, functional = 'DN', niter = 100)
##D 
##D par(mfrow = c(1,2), mar = c(0,0,2,0)+0.1)
##D plot(y0, interp = FALSE, axes = FALSE, main = 'naive')
##D mtext(paste(round(PSNR(im0, y0),2), 'dB'), side = 1, line = -2)
##D plot(x0, interp = FALSE, axes = FALSE, main = 'proposed')
##D mtext(paste(round(PSNR(im0, x0),2), 'dB'), side = 1, line = -2)
## End(Not run)



