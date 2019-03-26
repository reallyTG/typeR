library(Sleuth3)


### Name: case1102
### Title: The Blood-Brain Barrier
### Aliases: case1102
### Keywords: datasets

### ** Examples

str(case1102)
attach(case1102)

## EXPLORATION
logRatio <- log(Brain/Liver)
logTime <- log(Time)
myMatrix <- cbind (logRatio, Days, Weight, Loss, Tumor, logTime)
if(require(car)){   # Use the car library
scatterplotMatrix(myMatrix,groups=Treatment,
  smooth=FALSE, diagonal="histogram", col=c("green","blue"), pch=c(16,17), cex=1.5)
}
 
myLm1 <- lm(logRatio ~ Treatment + logTime + Days + Sex + Weight + Loss + Tumor)
plot(myLm1, which=1)          
if(require(car)){   # Use the car library
  crPlots(myLm1) # Draw partial resdual plots. 
}                              

myLm2   <-  lm(logRatio ~ Treatment + factor(Time) + 
  Days + Sex + Weight + Loss + Tumor)  # Include Time as a factor.
anova(myLm1,myLm2)
if(require(car)){   # Use the car library
  crPlots(myLm2) # Draw partial resdual plots. 
}    

summary(myLm2)  # Use backard elimination 
myLm3 <- update(myLm2, ~ . - Days)   
summary(myLm3)  
myLm4 <- update(myLm3, ~ . - Sex)          
summary(myLm4)
myLm5 <- update(myLm4, ~ . - Weight)
summary(myLm5)
myLm6 <- update(myLm5, ~ . - Tumor)
summary(myLm6)                             
myLm7 <- update(myLm6, ~ . - Loss)
summary(myLm7)   # Final model for inference


## INFERENCE AND INTERPRETATION
myTreatment <- factor(Treatment,levels=c("NS","BD")) # Change level ordering 
myLm7a  <- lm(logRatio ~  factor(Time) + myTreatment)
summary(myLm7a) 
beta <- myLm7a$coef
exp(beta[5])         
exp(confint(myLm7a,5))
# Interpetation: The median ratio of brain to liver tumor counts for barrier-
# disrupted rats is estimated to be 2.2 times the median ratio for control rats 
# (95% CI: 1.5 times to 3.2 times as large). 

## DISPLAY FOR PRESENTATION 
ratio <- Brain/Liver
jTime <- exp(jitter(logTime,.2)) # Back-transform a jittered version of logTime
plot(ratio ~ jTime, log="xy",
  xlab="Sacrifice Time (Hours), jittered; Log Scale",
  ylab="Effectiveness: Brain Tumor Count Relative To Liver Tumor Count; Log Scale",
  main="Blood Brain Barrier Disruption Effectiveness in 34 Rats", 
  pch= ifelse(Treatment=="BD",21,24), bg=ifelse(Treatment=="BD","green","orange"),
  lwd=2, cex=2)
dummyTime     <- c(0.5, 3, 24, 72)
controlTerm   <- beta[1] + beta[2]*(dummyTime==3) + 
  beta[3]*(dummyTime==24) + beta[4]*(dummyTime==72)
controlCurve  <- exp(controlTerm)
lines(controlCurve ~ dummyTime, lty=1,lwd=2)
BDTerm        <- controlTerm + beta[5]
BDCurve       <- exp(BDTerm)
lines(BDCurve ~ dummyTime,lty=2,lwd=2)
legend(0.5,10,c("Barrier disruption","Saline control"),pch=c(21,22),
  pt.bg=c("green","orange"),pt.lwd=c(2,2),pt.cex=c(2,2), lty=c(2,1),lwd=c(2,2))

detach(case1102)



