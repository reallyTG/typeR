library(measuRing)


### Name: graySmoothed
### Title: Smoothed gray
### Aliases: graySmoothed

### ** Examples

## (not run) Read one image section in package measuRing:
image1 <- system.file("P105_a.png", package="measuRing")    
## (not run) the smoothed gray:
smoothed <- graySmoothed(image1,ppi=1000)
## (not run) Plot of the smoothed gray:        
Smooth <- ts(smoothed)
main. <- 'Smoothed gray'
plot(Smooth,xlab = 'Column', main=main.,
     ylab = 'Smoothed gray',col = 'gray')




