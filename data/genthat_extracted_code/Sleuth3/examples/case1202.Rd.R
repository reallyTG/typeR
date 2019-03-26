library(Sleuth3)


### Name: case1202
### Title: Sex discrimination in Employment
### Aliases: case1202
### Keywords: datasets

### ** Examples

str(case1202)
attach(case1202)

## EXPLORATION
logSal <- log(Bsal)    
myMatrix <- cbind (logSal, Senior,Age, Educ, Exper)   
if(require(car)){   # Use the car library
  scatterplotMatrix(myMatrix, smooth=FALSE, diagonal="histogram",
                    groups=Sex, col=c("red","blue") )   
}                                
myLm1 <- lm(logSal ~ Senior + Age + Educ + Exper + Sex)
plot(myLm1, which=1)           
plot(myLm1, which=4) #  Cook's Distance 
if(require(car)){   # Use the car library
  crPlots(myLm1)    # Partial residual plots
}             
ageSquared    <- Age^2   
ageCubed      <- Age^3     
experSquared  <- Exper^2
experCubed    <- Exper^3
myLm2 <- lm(logSal ~ Senior + Age + ageSquared  + ageCubed + 
  Educ + Exper + experSquared + experCubed  + Sex)
plot(myLm2, which=1)  # Residual plot         
plot(myLm1, which=4)  # Cook's distance         

if(require(leaps)){   # Use the leaps library
  mySubsets     <- regsubsets(logSal ~ (Senior + Age + Educ + Exper + 
    ageSquared  + experSquared)^2, nvmax=25, data=case1202)    
  mySummary  <- summary(mySubsets)    
  p  <- apply(mySummary$which, 1, sum)     
  plot(mySummary$bic ~ p, ylab = "BIC")            
  cbind(p,mySummary$bic)  
  mySummary$which[8,]  # Note that Age:ageSquared = ageCubed
}
myLm3         <- lm(logSal ~ Age + Educ + ageSquared + Senior:Educ + 
  Age:Exper + ageCubed + Educ:Exper + Exper:ageSquared) 
summary(myLm3)

myLm4 <- update(myLm3, ~ . + Sex)  
summary(myLm4)
myLm5 <- update(myLm4, ~ . + Sex:Age + Sex:Educ + Sex:Senior + 
  Sex:Exper + Sex:ageSquared)
anova(myLm4, myLm5) 

## INFERENCE AND INTERPRETATION
summary(myLm4)
beta          <- myLm4$coef  
exp(beta[6])             
exp(confint(myLm4,6))    
# Conclusion:  The median beginning salary for males was estimated to be 12% 
# higher than the median salary for females with similar values of the available 
# qualification variables (95% confidence interval: 7% to 17% higher).

## DISPLAY FOR PRESENTATION        
years <- Exper/12  # Change months to years
plot(Bsal ~ years, log="y", xlab="Previous Work Experience (Years)",
  ylab="Beginning Salary (Dollars); Log Scale",
  main="Beginning Salaries and Experience for 61 Female and 32 Male Employees",
  pch= ifelse(Sex=="Male",24,21), bg = "gray", 
  col= ifelse(Sex=="Male","blue","red"), lwd=2, cex=1.8 )
myLm6 <- lm(logSal ~ Exper + experSquared + experCubed + Sex)
beta <- myLm6$coef
dummyExper <- seq(min(Exper),max(Exper),length=50)
curveF <- beta[1] + beta[2]*dummyExper + beta[3]*dummyExper^2 +
  beta[4]*dummyExper^3 
curveM <- curveF + beta[5]
dummyYears <- dummyExper/12
lines(exp(curveF) ~ dummyYears, lty=1, lwd=2,col="red")
lines(exp(curveM) ~ dummyYears, lty = 2, lwd=2, col="blue")
legend(28,8150, c("Male","Female"),pch=c(24,21), pt.cex=1.8, pt.lwd=2, 
  pt.bg=c("gray","gray"), col=c("blue","red"), lty=c(2,1), lwd=2) 

detach(case1202)



