library(Sleuth3)


### Name: case2101
### Title: Island Size and Bird Extinctions
### Aliases: case2101
### Keywords: datasets

### ** Examples

str(case2101)
attach(case2101)
      
## EXPLORATION AND MODEL BUILDING 
proportionExtinct <- Extinct/AtRisk
oddsExtinct  <- proportionExtinct/(1 - proportionExtinct)
logitExtinct <- log(oddsExtinct)   # Logit = Log Odds
logArea <- log(Area)
plot(logitExtinct ~ logArea)

binResponse  <- cbind(Extinct,AtRisk-Extinct)
myGlm1 <- glm(binResponse ~ logArea, family=binomial)
summary(myGlm1)
logArea2 <- logArea^2
myGlm2 <- update(myGlm1, ~ . + logArea2)
summary(myGlm2) # p-value for quadratic term: 0.77


## INFERENCE AND INTERPRETATION
myGlm3 <- update(myGlm1, ~ . - logArea)
anova(myGlm3, myGlm1) # Drop in deviance statistic = 33.277 on 1 d.f.
1 - pchisq(33.277,1) # p-value = 7.992234e-09
beta <- myGlm1$coef
1 - 2^beta[2]  # 0.1861153
1 - 2^confint(myGlm1,2) #0.2462041 0.1247743 
# Interpretation: Associated with each doubling of island area is a 19% 
# reduction in the odds of extinction (95% confidence interval: 12% to 25% 
# reduction).


## GRAPHICAL DISPLAY FOR PRESENTATION 
plot(oddsExtinct ~ Area, log="xy", ylab="Observed Odds of Extinction; log scale",
  xlab=expression(paste("Island Area (km"^"2","); log scale")),
  main="Extinctions of Bird Species in the Krunnit Island Archipelago",
  pch=21, lwd=2, bg="green", cex=2)   # Plot odds of extinction vs island area
dummyArea <- seq(min(Area),max(Area),length=50)
lp <- beta[1] + beta[2]*log(dummyArea)
odds <- exp(lp)
lines(odds ~ dummyArea,lwd=2)

plot(proportionExtinct ~ Area, log="xy", 
  ylab="Proportions of 1949 Species not Found in 1959",
  xlab=expression(paste("Island Area (km"^"2","); log scale")),
  main="Proportions of 1949 Bird Species Extinct in 1959 on 18 Krunnit Archipelago Islands",
  pch=21, lwd=2, bg="green", cex=2)  # Plot probability of extinction vs area
dummyArea  <- seq(min(Area),max(Area),length=50)
lp <- beta[1] + beta[2]*log(dummyArea)
myProbability <- exp(lp)/(1 + exp(lp))
lines(myProbability ~ dummyArea,lwd=2,col="blue")
legend(.08,.055,legend="Estimated Probability of Extinction",lty=1,lwd=2,col="blue")

detach(case2101)



