library(QuantPsyc)


### Name: lm.beta
### Title: Standardized Regression Coefficients
### Aliases: lm.beta
### Keywords: models

### ** Examples

us <- USJudgeRatings
names(us)
lm1 <- lm ( CONT ~ INTG + DMNR + DILG, us)
lm.beta(lm1)

# Standardized data (using Make.Z())

usz <- data.frame (Make.Z (us))
lm1.z <- lm ( CONT ~ INTG + DMNR + DILG, usz)

# compare standardized data versus lm.beta

summary(lm1.z)




