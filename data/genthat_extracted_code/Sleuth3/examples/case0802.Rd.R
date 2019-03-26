library(Sleuth3)


### Name: case0802
### Title: Breakdown Times for Insulating Fluid under different Voltage
### Aliases: case0802
### Keywords: datasets

### ** Examples

str(case0802)
attach(case0802)
     
## EXPLORATION
plot(Time ~ Voltage)
myLm <- lm(Time ~ Voltage)
plot(myLm, which=1)   # Residual plot
logTime <- log(Time)
plot(logTime ~ Voltage)
myLm <- lm(logTime ~ Voltage)
abline(myLm)
plot(myLm,which=1)  # Residual plot 
myOneWay <- lm(logTime ~ factor(Voltage))   
anova(myLm, myOneWay)  # Lack of fit test for simple regression (seems okay) 
 
## INFERENCE AND INTERPREATION
beta <- myLm$coef
100*(1 - exp(beta[2]))   # Back-transform estimated slope 
100*(1 - exp(confint(myLm,"Voltage")))  
# Interpretation: Associated with each 1 kV increase in voltage is a 39.8% 
# decrease in median breakdown time (95% CI: 32.5% decrease to 46.3% decrease).

## DISPLAY FOR PRESENTATION
options(scipen=50)  # Do this to avoid scientific notation on y-axis 
plot(Time ~ Voltage, log="y", xlab="Voltage (kV)",
  ylab="Breakdown Time (min.); Log Scale",
  main="Breakdown Time of Insulating Fluid as a Function of Voltage Applied",
  pch=21, lwd=2, bg="green", cex=1.75 )     
dummyVoltage <- c(min(Voltage),max(Voltage)) 
meanLogTime <- beta[1] + beta[2]*dummyVoltage  
medianTime <- exp(meanLogTime)  
lines(medianTime ~ dummyVoltage, lwd=2, col="blue")  

detach(case0802)



