library(beadarrayMSV)


### Name: shearRawSignal
### Title: Affine transformation of axes
### Aliases: shearRawSignal normalizeIllumina

### ** Examples

#Make artificial, heteroscedastic data
x1 <- 5 + exp(rnorm(1000))*100
y1 <- 100 + x1*.1 + x1*rnorm(1000,sd=.1)*.2
y2 <- 100 + exp(rnorm(1000))*70
x2 <- (y2-5)/10 + (y2-100)*rnorm(1000,sd=.1)*.2
rawData <- list()
rawData$x <- c(x1,x2)
rawData$y <- c(y1,y2)

#Affine transformation
normData <- normalizeIllumina(rawData,plot=FALSE,verbose=TRUE)

## Not run: 
##D #Affine transformation with plotting
##D dev.new()
##D normOpts <- setNormOptions(minSize=10)
##D normData <- normalizeIllumina(rawData,normOpts=normOpts,plot=TRUE,verbose=TRUE)
##D 
##D #After rotation and shearing
##D dev.new()
##D plot(normData$x,normData$y,pch='.',main='Affine transformation',xlab='R',ylab='G')
##D abline(v=0,h=0,col='blue')
## End(Not run)



