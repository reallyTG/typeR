library(Sleuth3)


### Name: case2002
### Title: Birdkeeping and Lung Cancer
### Aliases: case2002
### Keywords: datasets

### ** Examples

str(case2002)
attach(case2002)
   
## EXPLORATION AND MODEL BUILDING
myCode <- ifelse(BK=="Bird" & LC=="LungCancer","Bird & Cancer", 
  ifelse(BK=="Bird" & LC=="NoCancer","Bird & No Cancer",
  ifelse(BK=="NoBird" & LC=="LungCancer","No Bird & Cancer", "No Bird & No Cancer")))
table(myCode)
if(require(car)){   # Use the car library
scatterplotMatrix(cbind(AG,YR,CD), groups=myCode, diagonal="none",reg.line=FALSE,
  pch=c(15,21,15,21), col=c("dark green","dark green","purple","purple"),
  var.labels=c("Age","Years Smoked","Cigarettes per Day"), cex=1.5) 
}

# Reorder the levels so that the model is for log odds of cancer
LC    <- factor(LC, levels=c("NoCancer","LungCancer"))    
myGlm <- glm(LC ~ FM + SS + AG + YR + CD + BK, family=binomial)
if(require(car)){   # Use the car library
  crPlots(myGlm)  }
# It appears that there's an effect of Years of Smoking and of Bird Keeping
# after accounting for other variables; no obvious effects of other variables

# Logistic regression model building using backward elimination (witholding BK)
myGlm1 <- glm(LC ~ FM + SS + AG + YR + CD, family=binomial)
summary(myGlm1)
myGlm2 <- update(myGlm1, ~ . - SS)        
summary(myGlm2)
myGlm3 <- update(myGlm2, ~ . - CD)   
summary(myGlm3)
myGlm4 <- update(myGlm3, ~ . - FM)   
summary(myGlm4) # Everything left has a small p-value (retain the intercept)


## INFERENCE AND INTERPRETATION
myGlm5 <- update(myGlm4, ~ . + BK)    # Now add bird keeping
summary(myGlm5)
myGlm6 <- update(myGlm5, ~ . + BK:YR + AG:YR) # Try interaction terms
anova(myGlm6,myGlm5) # Drop-in-deviance = 1.61 on 2 d.f.
1 - pchisq(1.61,2)    # p-value = .45: no evidence of interaction
anova(myGlm4,myGlm5)   # Test for bird keeping effect
(1 - pchisq(12.612,1))/2  # 1-sided p-value: 0.0001916391
 
BK <- factor(BK, levels=c("NoBird", "Bird"))  # Make "no bird" the ref level
myGlm5b <- glm(LC ~ AG + YR + BK, family=binomial)   
beta <- myGlm5b$coef  # Extract estimated coefficients
exp(beta[4])   # 3.961248                
exp(confint(myGlm5b,4))   # 1.836764 8.900840  
# Interpretation: The odds of lung cancer for people who kept birds were 
# estimated to be 4 times the odds of lung cancer for people of similar age, sex, 
# smoking history, and socio-economic status who didn't keep birds
# (95% confidence interval for this adjusted odds ratio: 1.8 times to 8.9 times).

# See bestglm library for an alternative variable selection technique. 
 
detach(case2002)



