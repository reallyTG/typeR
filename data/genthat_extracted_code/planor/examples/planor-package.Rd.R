library(planor)


### Name: planor-package
### Title: Generation of Regular Factorial Designs
### Aliases: planor-package
### Keywords: package design

### ** Examples

# DESIGN SPECIFICATIONS
# Treatments: four 3-level factors A, B, C, D
# Units: 27 in 3 blocks of size 9
# Non-negligible factorial terms:
#   block + A + B + C + D + A:B + A:C + A:D + B:C + B:D + C:D
# Factorial terms to estimate:
#   A + B + C + D
# 1. DIRECT GENERATION, USING regular.design
mydesign <- regular.design(factors=c("block", LETTERS[1:4]),
  nlevels=rep(3,5), model=~block+(A+B+C+D)^2, estimate=~A+B+C+D,
  nunits=3^3, randomize=~block/UNITS)
print(mydesign)
# DUMMY ANALYSIS
# Here we omit two-factor interactions from the model, so they are 
# confounded with the residuals (but not with ABCD main effects)
set.seed(123)
mydesigndata <- mydesign@design
mydesigndata$Y <- runif(27)
mydesign.aov <- aov(Y ~ block + A + B + C + D, data=mydesigndata)
summary(mydesign.aov)
# 2. STEP-BY-STEP GENERATION, USING planor.designkey
F0 <- planor.factors(factors=c( "block", LETTERS[1:4]), nlevels=rep(3,5),
  block=~block)
M0 <- planor.model(model=~block+(A+B+C+D)^2, estimate=~A+B+C+D) 
K0 <- planor.designkey(factors=F0, model=M0, nunits=3^3, max.sol=2)
summary(K0)
mydesign.S4 <- planor.design(key=K0, select=2)



