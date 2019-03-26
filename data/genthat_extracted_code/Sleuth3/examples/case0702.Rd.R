library(Sleuth3)


### Name: case0702
### Title: Meat Processing and pH
### Aliases: case0702
### Keywords: datasets

### ** Examples

str(case0702)
attach(case0702)

# EXPLORATION
plot(pH ~ Time)  
myLm <- lm(pH ~ Time) 
abline(myLm, col="blue", lwd=2)   
lines(lowess(Time,pH), col="red", lty=2, lwd=2) # Add scatterplot smoother
plot(myLm, which=1)  # Residual plot

logTime <- log(Time)  
plot(pH ~ logTime)  
myLm2   <- lm(pH ~ logTime)  
abline(myLm2)  
plot(myLm2, which=1)  

## PREDICTION BAND ABOUT REGRESSION LINE
xToPredict    <- seq(1,8,length=100) # sequence from 1 to 8 of length 100 
logXToPredict <- log(xToPredict)  
newData       <- data.frame(logTime = logXToPredict)  
myPredict     <- predict(myLm2,newData,    
  interval="prediction", level=.90)  
plot(pH ~ logTime)   
abline(myLm2)  
lines(myPredict[,3]~ logXToPredict, lty=2)  
lines(myPredict[,2] ~ logXToPredict, lty=2) 
# Find smallest time at which the upper endpoint of a 90% prediction 
# interval is less than or equal to 6:
minTime <- min(xToPredict[myPredict[,3] <= 6.0])  
minTime    
abline(v=log(minTime),col="red")   

# DISPLAY FOR PRESENTATION 
plot(pH ~ Time, xlab="Time After Slaughter (Hours); log scale", 
  ylab="pH in Muscle", main="pH and Time after Slaughter for 10 Steers",  
  log="x", pch=21, lwd=2, bg="green", cex=2 ) 
lines(xToPredict,myPredict[,1], col="blue",  lwd=2)  
lines(xToPredict, myPredict[,3], lty=2, col="blue", lwd=2)  
lines(xToPredict, myPredict[,2], lty=2,   col="blue", lwd=2) 
legend(3,7, c("Estimated Regression Line","90% Prediction Band"),   
  lty=c(1,2), col="blue", lwd=c(2,2))  
abline(h=6, lty=3, col="purple", lwd=2)  
text(1.5,6.05,"Desired pH", col="purple")  
lines(c(minTime,minTime),c(5,6.15), col="purple", lwd=2)  
text(minTime,6.2,"4.9 hours",col="purple",cex=1.25)  
  
detach(case0702)  



