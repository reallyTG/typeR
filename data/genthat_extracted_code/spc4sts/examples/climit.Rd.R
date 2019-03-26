library(spc4sts)


### Name: climit
### Title: Control Limit and Diagnostic Threshold Construction
### Aliases: climit climit2 print.climit

### ** Examples

## build the in-control model
img <- sarGen(phi1 = .6, phi2 = .35, m = 100, n = 100, border = 50) # training image
model <- surfacemodel(img,1)

## generate Phase I images
imgs <- array(0, c(100,100,3))
for (j in 1:dim(imgs)[3]) imgs[,,j] <- sarGen(phi1 = .6, phi2 = .35, m = 100, n = 100, border = 50)

## establish control limits and diagnostic thresholds
# construct control limits (for both local defects and global changes)
# and diagnostic thresholds (for local defects) for the first time
cl <- climit(imgs, fa.rate = .05, model, type = 1:2, stat = "ad", w = 5, nD = 50)
# update new control limit and diagnostic threshold
cl2 <- climit2(cl, fa.rate = .01, nD = 5)

## after that, monitor a Phase II image as follows:
# create a new image with a local defect
img2 <- sarGen(phi1 = .6, phi2 = .35, m = 100, n = 100, border = 50) # simulate a new image
img3 <- imposeDefect(img2)$img # add a local defect to this image
ms3 <- monitoringStat(img = img3, model = model, cl = cl2) # computing monitoring statistic
# now create a new image with parameters reduced by 5%, representing a global change
img4 <- sarGen(phi1 = .6*.95, phi2 = .35*.95, m = 100, n = 100, border = 50)
ms4 <- monitoringStat(img = img4, model = model, cl = cl2) # computing monitoring statistic

## diagnose for local defect regions in img3
bimg <- diagnoseLD(ms3, dth = 9, plot.it = FALSE) # use climit() to find dth
par(mfcol = c(1, 2))
par(mar = c(2, 0.5, 1, 0.5))
image(xaxt = 'n', yaxt = 'n', as.matrix(t(apply(img3 , 2, rev))),
      col = gray((0:32)/32), xlab = '', ylab = '', asp = 1, bty = 'n')
image(xaxt = 'n', yaxt = 'n', as.matrix(t(apply(bimg , 2, rev))),
      col = gray(c(1, .5)), xlab = '', ylab = '', asp = 1, bty = 'n')

#
# NOTE: The above example is just for quick illustration. To obtain a good
# control limit, the training image should be representative (e.g., set
# m = 250, n = 250, and border = 200). The number of Phase I images also
# needs to be large (e.g., 100 images or more).
#
# For real images in a textile application, use the R data package "textile".
#




