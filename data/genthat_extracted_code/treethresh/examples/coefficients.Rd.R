library(treethresh)


### Name: coefficients
### Title: Extracting and updating coefficients stored in wd or imwd
###   objects
### Aliases: extract.coefficients insert.coefficients
###   extract.coefficients.wd insert.coefficients.wd
###   extract.coefficients.imwd insert.coefficients.imwd
### Keywords: utilities

### ** Examples

## The following examples shows how an example image can be
## thresholded step by step. All the steps are combined in the more
## user-friendly function wavelet.treethresh

## (01) Load the example image
data(tiles)

## (02) Display the image
par(mai=rep(0,4)) ; image(tiles,col=grey(0:255/255))

## (03) Add noise to the image
corrupted <- tiles + rnorm(length(tiles))

## (04) Display the corrupted image
par(mai=rep(0,4)) ; image(corrupted, col=grey(0:255/255))

## (05) Compute the wavelet transform
corrupted.wt <- imwd(corrupted)

## (06) Estimate the standard error
dev <- estimate.sdev(corrupted.wt)

## (07) Extract the coefficient matrices to be thresholded
coefs <- extract.coefficients(corrupted.wt)

## (08) Rescale the coefficients using the estimated standard error
## (should be around 1)
for (nm in names(coefs))
  coefs[[nm]] <- coefs[[nm]] / dev

## (09) Compute the tree
coefs.tree <- wtthresh(coefs)

## (10) Prune the tree
coefs.pruned.tree <- prune(coefs.tree)

## (11) Threshold according to the pruned tree
coefs.threshed <- thresh(coefs.pruned.tree)

## (12) Undo the rescaling
for (nm in names(coefs))
  coefs.threshed[[nm]] <- coefs.threshed[[nm]] * dev

## (13) Update coefficients
denoised.wt <- insert.coefficients(corrupted.wt, coefs.threshed)

## (14) Compute inverse wavelet transform
denoised <- imwr(denoised.wt)

## (15) Display denoised image
par(mai=rep(0,4)) ; image(denoised, col=grey(0:255/255))

## (16) Compute l2 loss
sum((denoised-tiles)^2)

## Equivalently we could have called
## denoised.wt <- wavelet.treethresh(corrupted.wt)
## instead of steps (06) - (13)



