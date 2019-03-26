library(hysteresis)


### Name: HysteresisData
### Title: Simulated Loop Data for 6 Loops with period=24, n=5 and m=3
### Aliases: HysteresisData
### Keywords: datasets

### ** Examples

## Data file is created using the following code
set.seed(1)
loop1 <- mloop(n=5,m=3, retention = 0.4, b.x = 0.3, b.y = 0.8, cx = 0, cy = 0, 
    sd.x = 0.1, sd.y = 0.1, period = 24, n.points = 48, phase.angle = pi/2)
loop2 <- mloop(n=5,m=3, retention = 0.8, b.x = 0.6, b.y = 0.8, cx = 0, cy = 0, 
    sd.x = 0.1, sd.y = 0.1, period = 24, n.points = 48, phase.angle = pi/2)
loop3 <- mloop(n=5,m=3, retention = 0.6, b.x = 1, b.y = 0.8, cx = 0, cy = 0, 
    sd.x = 0.1, sd.y = 0.1, period = 24, n.points = 48, phase.angle = pi/2)
X <- c(loop1$x, loop2$x, loop3$x)
Y <- c(loop1$y, loop2$y, loop3$y)
subjects <- c(rep("A", length(loop1$x)), rep("B", length(loop2$x)), rep("C",length(loop3$x)))  
    repeated <- rep(c(1,2),each=24,times=3)  
    
##Use data to fit 6 Hysteresis Loops  
data(HysteresisData)
six.loops <- floop.repeated(HysteresisData$X, HysteresisData$Y, n=5,m=3,
subjects = HysteresisData$subjects,repeated=HysteresisData$repeated)
six.loops

#Model fit for B-1
six.loops$models["B",1] 
par(mfrow=c(2,3))
plot(six.loops)
par(mfrow=c(1,1))



