library(Sleuth3)


### Name: case2202
### Title: Characteristics Associated with Salamander Habitat
### Aliases: case2202
### Keywords: datasets

### ** Examples

str(case2202)
attach(case2202)
       
## EXPLORATION AND MODEL BUILDING
logSalamanders <- log(Salamanders + .5)
logForestAge   <- log(ForestAge + .5)
myMatrix       <- cbind(PctCover,logForestAge,logSalamanders)
if (require(car)) { # Use car library
 scatterplotMatrix(myMatrix, diagonal="histogram", reg.line=FALSE, spread=FALSE)
}

myGlm1  <- glm(Salamanders ~ PctCover + logForestAge + PctCover:logForestAge, 
  family=poisson)
summary(myGlm1)   # Backward elimination...
myGlm2 <- update(myGlm1, ~ . - PctCover:logForestAge)
summary(myGlm2)
myGlm3  <- update(myGlm2, ~ . - logForestAge)
summary(myGlm3)   # PctCover is the only explanatory variable remaining

plot(Salamanders ~ PctCover)  # It appears that there are 2 distributions
# of Salamander counts; one for PctCover < 70 and one for PctCover > 70

# See if PctCover is associated Salamanders in each subset
myGlm4 <- glm(Salamanders ~ PctCover, family=poisson,subset=(PctCover > 70))
summary(myGlm4)           # No evidence of an effect for this subset
myGlm5 <- glm(Salamanders ~ PctCover, family=poisson,subset=(PctCover < 70))
summary(myGlm5)           # No evidence on this subset either

## INFERENCE  (2 means)
Group <- ifelse(PctCover > 70,"High","Low")
Group <- factor(Group, levels=c("Low","High") )  # Make "Low Cover" the ref group
myGlm6 <- glm(Salamanders ~ Group, family=poisson)
summary(myGlm6)


## GRAPHICAL DISPLAY FOR PRESENTATION
plot(Salamanders ~ PctCover, ylab="Number of Salamanders",
  xlab="Percentage of Canopy Covered",
  main="Number of Salamanders versus Percent Canopy Cover",
  pch=21,bg="green", cex=2, lwd=2)
beta <- myGlm6$coef
lines(c(0,55),exp(c(beta[1],beta[1])),lwd=2)
text(56,exp(beta[1]),paste("mean= ",round(exp(beta[1]),1)),adj=0)
lines(c(76,93),exp(c(beta[1]+beta[2],beta[1]+beta[2])),lwd=2)
text(56,exp(beta[1]+beta[2]),paste("mean=",round((beta[1]+beta[2]),1)),adj=-1)
    
detach(case2202)



