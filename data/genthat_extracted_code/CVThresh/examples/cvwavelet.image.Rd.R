library(CVThresh)


### Name: cvwavelet.image
### Title: Wavelet reconstruction of image by level-dependent
###   Cross-Validation
### Aliases: cvwavelet.image
### Keywords: nonparametric

### ** Examples
 
# Generate Noisy Lennon Image
data(lennon)
sdimage <- sd(as.numeric(lennon))
nlennon <- ncol(lennon); nlevel <- log2(ncol(lennon))
optlevel <- c(3:(nlevel-1))
set.seed(55)
lennonnoise <- lennon+matrix(rnorm(nlennon^2, 0, sdimage), nlennon, nlennon)

# Level-dependent Cross-validation Thresholding
lennonwd <- imwd(lennonnoise)
#lennoncv <- cvwavelet.image(images=lennonnoise, imagewd=lennonwd,
#      cv.optlevel=optlevel, cv.bsize=c(1,1), cv.kfold=10)$imagecv
#image(lennoncv, axes=FALSE, col=gray(100:0/100), 
#   main="Level-dependent CV")



