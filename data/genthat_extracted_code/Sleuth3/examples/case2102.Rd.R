library(Sleuth3)


### Name: case2102
### Title: Moth Coloration and Natural Selection
### Aliases: case2102
### Keywords: datasets

### ** Examples

str(case2102)
attach(case2102)
   
## EXPLORATION  AND MODEL BUILDING
proportionRemoved <- Removed/Placed
myPointCode <- ifelse(Morph=="dark",21,22)
myPointColor <- ifelse(Morph=="dark","blue","gray")
plot(proportionRemoved ~ Distance, pch=myPointCode, bg=myPointColor, cex=2, lwd=2)

binResponse <- cbind(Removed, Placed-Removed)
Morph <- factor(Morph, levels=c("light","dark"))  # Make "light" the ref  level
myGlm1 <- glm(binResponse ~ Distance + Morph + Distance:Morph, family=binomial)
summary(myGlm1)  # Residual deviance:  13.230  on 10  degrees of freedom
1 - pchisq(13.230,10)  # No evidence of overdispersion
myGlm2  <- update(myGlm1, ~ . - Distance:Morph)
anova(myGlm2, myGlm1) # Drop in deviance statistic = 11.931 on 1 d.f.
1 - pchisq(11.931,1)  # p-value = 0.0005520753 => strong evidence of interaction
# It appears that the intercepts are the same for both light and dark morphs, 
# that there is no effect of Distance for light morphs, but there is an effect 
# of Distance for dark morphs.
 

## INFERENCE AND INTERPREATION
myTerm  <- Distance*ifelse(Morph=="dark",1,0) # Create indicator var for "dark"
myGlm3 <- glm(binResponse ~ myTerm, family=binomial)
summary(myGlm3)


## GRAPHICAL DISPLAY FOR PRESENTATION
myPointCode <- ifelse(Morph=="dark",22,24)
myPointColor  <- ifelse(Morph=="dark","blue","orange")
plot(proportionRemoved ~ Distance, ylab="Proportion of Moths Taken",
  main="Proportions of Moths Taken by Predators at Seven Locations",
  xlab="Distance from Liverpool (km)", pch=myPointCode, bg=myPointColor, cex=2, 
  lwd=2) 
beta  <- myGlm3$coef
dummyDist <- seq(0,55,length=50)
lp <- beta[1] + beta[2]*dummyDist
propDark <- exp(lp)/(1 + exp(lp))
lines(propDark ~ dummyDist,lwd=2,col="blue")
propLight <- rep(exp(beta[1])/(1 + exp(beta[1])),length(dummyDist))
lines(propLight ~ dummyDist,lwd=2,col="orange")  
legend(0,0.47,legend=c("Dark Morph","Light Morph"),
  pch=c(22,24),pt.bg=c("blue","orange"),pt.cex=c(2,2),pt.lwd=c(2,2))

detach(case2102)



