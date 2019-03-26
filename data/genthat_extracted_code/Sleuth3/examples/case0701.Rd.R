library(Sleuth3)


### Name: case0701
### Title: The Big Bang
### Aliases: case0701
### Keywords: datasets

### ** Examples

str(case0701) 
attach(case0701)  

## EXPLORATION
plot(Distance ~ Velocity)   
myLm <- lm(Distance ~ Velocity)  
abline(myLm) 

myResiduals <- myLm$res  
myFits  <- myLm$fit  
plot(myResiduals ~ myFits)   # Plot residuals versus estimated means.
abline(h=0)  # Draw a horizontal line at 0.     
# OR, use this shortcut...
plot(myLm, which=1) # Residual plot (red curve is a scatterplot smooother)

## INFERENCE
summary(myLm)  
confint(myLm,level=.95)   
myLm2 <- lm(Distance ~ Velocity - 1)   # Drop the intercept.
summary(myLm2) 
confint(myLm2) 

## DISPLAY FOR PRESENTATION
plot(Distance ~ Velocity, xlab="Recession Velocity (km/sec)", 
  ylab="Distance from Earth (megaparsecs)", 
  main="Measured Distance Versus Velocity for 24 Extra-Galactic Nebulae", 
  pch=21, lwd=2, bg="green", cex=1.5 )  
abline(myLm, lty=2, col="blue", lwd=2) 
abline(myLm2, lty=3, col="red", lwd=2) 
legend(-250,2.05, 
  c("unrestricted regression line","regression through the origin"),  
  lty=c(2,3), lwd=c(2,2), col=c("blue","red")) 

detach(case0701)   



