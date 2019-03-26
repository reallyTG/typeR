library(Sleuth3)


### Name: case1001
### Title: Galileo's Data on the Motion of Falling Bodies
### Aliases: case1001
### Keywords: datasets

### ** Examples

str(case1001)
attach(case1001)
      
## EXPLORATION
plot(Distance ~ Height)
myLm <- lm(Distance ~ Height)
plot(myLm, which=1)         
height2 <- Height^2
myLm2 <- lm(Distance ~ Height + height2)
plot(myLm2, which=1)        
summary(myLm2) # Note p-value for quadratic term (it's small)
height3 <- Height^3
myLm3 <- update(myLm2, ~ . + height3)  
plot(myLm3,which=1)         
summary(myLm3) # Note p-value for cubic term (it's small)              
height4 <- Height^4
myLm4 <- update(myLm3, ~ . + height4)
summary(myLm4) # Note p-value for quartic term (it's not small)             

## DISPLAY FOR PRESENTATION 
plot(Distance ~ Height, xlab="Initial Height (Punti)",
  ylab="Horizontal Distance Traveled (Punti)",
  main="Galileo's Falling Body Experiment",
  pch=21, bg="green", lwd=2, cex=2)
dummyHeight     <- seq(min(Height),max(Height),length=100)         
betaQ           <- myLm2$coef  
quadraticCurve  <- betaQ[1] + betaQ[2]*dummyHeight + betaQ[3]*dummyHeight^2  
lines(quadraticCurve ~ dummyHeight,col="blue",lwd=3)  
betaC           <- myLm3$coef # coefficients of cubic model  
cubicCurve      <- betaC[1] + betaC[2]*dummyHeight + betaC[3]*dummyHeight^2 +
  betaC[4]*dummyHeight^3  
lines(cubicCurve ~ dummyHeight,lty=3,col="red",lwd=3) 
legend(590,290,legend=c(expression("Quadratic Fit  "*R^2*" = 99.0%"),
  expression("Cubic Fit        "*R^2*" = 99.9%")),  
  lty=c(1,3),col=c("blue","red"), lwd=c(3,3))
  
detach(case1001)



