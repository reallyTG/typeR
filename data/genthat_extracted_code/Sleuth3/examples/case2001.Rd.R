library(Sleuth3)


### Name: case2001
### Title: Survival in the Donner Party
### Aliases: case2001
### Keywords: datasets

### ** Examples

str(case2001)
attach(case2001)
      
## EXPLORATION AND MODEL BUILDING
myPointCode   <- ifelse(Sex=="Female",22,24)
myPointColor  <- ifelse(Sex=="Female","green","orange")
survivalIndicator <- ifelse(Status=="Survived",1,0)
jFactor <- 0.1   # jittering factor
plot(jitter(survivalIndicator,jFactor) ~ jitter(Age, jFactor),
  pch=myPointCode, bg=myPointColor, cex=1.5)
# Logistic regression. Start with a rich model; use backward elimination
ageSquared <- Age^2
myGlm1 <- glm(Status ~ Age + ageSquared + Sex + Age:Sex + ageSquared:Sex, 
  family=binomial)
# Use backward elimination, but remove interaction and squared terms 1st 
summary(myGlm1)
myGlm2 <- update(myGlm1, ~ . - ageSquared:Sex)
summary(myGlm2)
myGlm3 <- update(myGlm2, ~ . - ageSquared)
summary(myGlm3)   # Wald test p-value for interaction of Age and Sex is: 0.0865
# More accurate likelihood ratio (drop in deviance) test:
myGlm4 <-update(myGlm3, ~ . - Age:Sex)
anova(myGlm4, myGlm3)  # Drop-in-devaince chi-square stat = 3.9099 on 1 d.f.
 1 - pchisq(3.9099,1)  # 2-sided p-value = 0.048
 
## INFERENCE AND INTERPRETATION
# Proceed by ignoring interaction (for a casual and approximate analysis) 
myGlm5  <- update(myGlm4, ~ . - Sex)
anova(myGlm5, myGlm4) # Drop-in-deviance chi-square statistic = 5.0344 on 1 d.f.
1 - pchisq(5.0344,1)  # 2-sided p-value 0.02484869: Highly suggestive  
0.0248869/2  # 1-sided p-value = half the 2-sided p-value = 0.01244345
# Interpretation and confidence interval
Sex <- factor(Sex,levels=c("Male","Female")) # Reorder levels so "Male" is ref 
myGlm4b <- glm(Status ~ Age + Sex, family=binomial)
beta <- myGlm4b$coef
exp(beta[3]) # 4.939645 
exp(confint(myGlm4b,3))  # 25.246069  1.215435 
# Interpretation: The odds of survival for females are estimated to be 5 times 
# the odds of survival of similarly-aged mean (95% CI: 1.2 times to 25.2 times).


## GRAPHICAL DISPLAY FOR PRESENTATION 
myPointCode <- ifelse(Sex=="Female",22,24)
myPointColor <- ifelse(Sex=="Female","green","orange")
myLineColor <- ifelse(Sex=="Female","dark green","blue")
survivalIndicator <- ifelse(Status=="Survived",1,0)
jFactor <- 0.1
plot(jitter(survivalIndicator,jFactor) ~ jitter(Age, jFactor),
  ylab="Estimated Survival Probability", xlab="Age (years)",
  main=c("Donner Party Survival by Sex and Age"), xlim=c(15,75),   
  pch=myPointCode, bg=myPointColor, col=myLineColor, cex=2, lwd=3)
beta            <- myGlm4b$coef
dummyAge        <- seq(15,65,length=50)
linearMale      <- beta[1] + beta[2]*dummyAge  #log odds of survival for males
linearFemale    <- linearMale + beta[3] #log odds of survival for females
pCurveMale      <- exp(linearMale)/(1 + exp(linearMale) ) # survival prob; males
pCurveFemale    <- exp(linearFemale)/(1 + exp(linearFemale)) # females
lines(pCurveMale ~ dummyAge,lty=2,col="blue",lwd=3)
lines(pCurveFemale[dummyAge <= 50] ~ dummyAge[dummyAge <= 50],lty=1,
  col="dark green",lwd=3)

legend(63,.5,legend=c("Females","Males"), pch=c(22,24),
  pt.bg = c("green","orange"), pt.cex=c(2,2), lty=c(1,2), lwd=c(3,3),
  col=c("dark green","blue"))
text(72,1,"Survived (20)")
text(72,0,"Died (25)")

detach(case2001)



