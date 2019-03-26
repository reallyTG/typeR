library(treethresh)


### Name: wavelet.treethresh
### Title: Threshold wavelet coefficients
### Aliases: wavelet.treethresh
### Keywords: tree nonparametric

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
par(mai=rep(0,4)) ; image(corrupted,col=grey(0:255/255))

## (05) Compute the wavelet transform
corrupted.wt <- imwd(corrupted)

## (06) Perform the thresholding
denoised.wt <- wavelet.treethresh(corrupted.wt)

## (07) Compute inverse wavelet transform
denoised <- imwr(denoised.wt)

## (08) Display denoised image
par(mai=rep(0,4)) ; image(denoised,col=grey(0:255/255))

## (09) Compute l2 loss
sum((denoised-tiles)^2)

## The call to wavelet.treethresh is equivalent to steps (06) to (13)
## of the example in the help section "coefficients".



