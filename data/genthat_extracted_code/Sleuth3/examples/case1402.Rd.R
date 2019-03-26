library(Sleuth3)


### Name: case1402
### Title: Effect of Ozone, SO2 and Drought on Soybean Yield
### Aliases: case1402
### Keywords: datasets

### ** Examples

str(case1402)
attach(case1402)

## EXPLORATION AND MODEL DEVELOPMENT; FORREST CULTIVAR
logForrest <- log(Forrest) 
# Fit model without interactions first--to examine partial residual plots.             
myLm1 <- lm(logForrest ~ Stress + SO2 + O3) 
if(require(car)){  # Use the car library
  crPlots(myLm1)   # Partial res plots => linear effects of SO2 and O3 look ok.
}  
myLm2 <- lm(logForrest ~ (Stress + SO2  + O3)^2) # all 2-factor interactions.
plot(myLm1, which=1)   # Residual plot looks ok.
anova(myLm1,myLm2) # Test for interactive effects.

## INFERENCE AND INTERPRETATION; FORREST CULTIVAR
summary(myLm1)   
betaF  <- myLm1$coef
# Effect of 0.01 increase in SO2 (note coeff is negative):
100*(1 - exp(0.01*betaF[3]))                
#1.655701;   a 1.65% decrease in median yield 
100*(1-exp(0.01*confint(myLm1,"SO2")))  
#3.772277 -0.5074294: 95% onfidence interval for effect of 0.01 increase in SO2
# Effect of 0.01 increase in O3 (note coeff is negative):
100*(1 - exp(0.01*betaF[4]))             
# 5.585979   I.e. a 5.6% decrease in median yield  
100*(1-exp(0.01*confint(myLm1,"O3")))   
#7.445966 3.688613: 95% confidence interval for effect of 0.01 increase in O3
# Effect of water stress (note coeff is positive for effect of well-watered):
100*(1 - exp(-betaF[2]))  # Get estimate for negative of this beta                
#3.220556:  a 3.2% decrease in median yield due to water stress
100*(1-exp(-confint(myLm1,2)))          
#-7.875521 13.17529: 95% confidence interval

## DISPLAY FOR PRESENTATION; FORREST CULTIVAR 
jO3     <- jitter(O3,factor=.25) # Jitter for plotting; jittering factor 0.25.
jS      <- jitter(SO2,factor=.25)  # Jitter SO2 for plotting.
cexfac  <- 1.75  # Use character expansion factor of 1.75 for plotting symbols.
opar <- par(no.readonly=TRUE)  # Store current graphics parameters settings
par(mfrow=c(1,2))  # Make a panel of 2 plots in 1 row.
myPointCode  <- ifelse(Stress=="Well-watered",21,24)
myPointColor <- ifelse(Stress=="Well-watered","green","orange")
par(mar=c(4.1,4.1,2.1,0.1))
plot(Forrest ~ jO3, log="y", ylab="Yield of Forrest Cultivar (kg/ha)",
	xlab=expression(paste(italic("Ozone ("),mu,"L/L), jittered")),
  pch=myPointCode, lwd=2, bg=myPointColor, cex=cexfac)
legend(.02,2400, c("Well-watered","Water Stressed"), pch=c(21,24),
  pt.cex=cexfac, pt.bg=c("green","orange"), pt.lwd=2, lty=c(3,1), lwd=c(2,2))
dummyO    <- seq(min(O3), max(O3), length=2)
curve1    <- exp(betaF[1] + betaF[3]*mean(SO2) + betaF[4]*dummyO)
curve2    <- exp(betaF[1] + betaF[2] + betaF[3]*mean(SO2)+ betaF[4]*dummyO)
lines(curve1 ~ dummyO,lwd=2)
lines(curve2 ~ dummyO,lwd=2,lty=3)

# PLOT FORREST VS SO2
par(mar=c(4.1,2.1,2.1,2.1)) # Change margins
plot(Forrest ~ jS, log="y", ylab="",
	xlab=expression(paste(italic("Sulfur Dioxide ("),mu,"L/L), jittered")),
  yaxt="n", pch=myPointCode, lwd=2, bg=myPointColor, cex=cexfac)
dummyS    <- seq(min(SO2),max(SO2),length=2)
curve1    <- exp(betaF[1] + betaF[3]*dummyS + betaF[4]*mean(O3))
curve2    <- exp(betaF[1] + betaF[2] + betaF[3]*dummyS + betaF[4]*mean(O3))
lines(curve1 ~ dummyS,lwd=2)
lines(curve2 ~ dummyS,lwd=2,lty=3)
par(opar) # Restore previous graphics parameter settings

detach(case1402)



