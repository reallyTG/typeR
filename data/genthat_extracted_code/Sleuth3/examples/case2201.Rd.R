library(Sleuth3)


### Name: case2201
### Title: Age and Mating Success of Male Elephants
### Aliases: case2201
### Keywords: datasets

### ** Examples

str(case2201)
attach(case2201)
       
## EXPLORATION AND MODEL BUILDING 
plot(Matings ~ Age,  log="y")
ageSquared  <- Age^2
myGlm1 <- glm(Matings ~ Age + ageSquared, family=poisson)
summary(myGlm1)  # No evidence of a need for ageSquared


## INFERENCE AND INTERPRETATION
myGlm2  <- update(myGlm1, ~ . - ageSquared)
summary(myGlm2)
beta  <- myGlm2$coef
exp(beta[2])  #1.071107
exp(confint(myGlm2,2))  #1.042558 1.100360 
# Interpretation: Associated with each 1 year increase in age is a 7% increase 
# in the mean number of matings (95% confidence interval 4% to 10% increase).


## GRAPHICAL DISPLAY FOR PRESENTATION
plot(Matings ~ Age, ylab="Number of Successful Matings",
  xlab="Age of Male Elephant (Years)",
  main="Age and Number of Successful Matings for 41 African Elephants",
  pch=21, bg="green", cex=2, lwd=2)
dummyAge <- seq(min(Age),max(Age), length=50)
lp <- beta[1] + beta[2]*dummyAge
curve <- exp(lp)
lines(curve ~ dummyAge,lwd=2)  

detach(case2201)



