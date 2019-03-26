library(hysteresis)


### Name: EllipseData
### Title: Simulated Ellipse Data for 6 Ellipses with period=24.
### Aliases: EllipseData
### Keywords: datasets

### ** Examples

## Data is created using the following code
set.seed(1)
ellip1 <- mel(method = 2, retention = 0.4, b.x = 0.6, b.y = 0.8, cx = 0, cy = 0, 
    sd.x = 0.1, sd.y = 0.1, period = 24, n.points = 48, phase.angle = pi/2)
ellip2 <- mel(method = 2, retention = 0.8, b.x = 0.6, b.y = 0.8, cx = 0, cy = 0, 
    sd.x = 0.1, sd.y = 0.1, period = 24, n.points = 48, phase.angle = pi/2)
ellip3 <- mel(method = 2, retention = 0.4, b.x = 1, b.y = 0.8, cx = 0, cy = 0, 
    sd.x = 0.1, sd.y = 0.1, period = 24, n.points = 48, phase.angle = pi/2)
X <- c(ellip1$x, ellip2$x, ellip3$x)
Y <- c(ellip1$y, ellip2$y, ellip3$y)
subjects <- c(rep("A", length(ellip1$x)), rep("B", length(ellip2$x)), rep("C", 
    length(ellip3$x)))  
    repeated <- rep(c(1,2),each=24,times=3)  
    
##Use data file to fit 6 ellipses.
data(EllipseData) 
six.models <- fel.repeated(EllipseData$X, EllipseData$Y, method = "harmonic2",
subjects = EllipseData$subjects,repeated=EllipseData$repeated)
six.models
 
#Model fit for B-1
six.models$models["B",1] 
par(mfrow=c(2,3))
plot(six.models,xlab="X input",ylab="Y output")
par(mfrow=c(1,1))



