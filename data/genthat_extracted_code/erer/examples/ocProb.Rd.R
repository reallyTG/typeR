library(erer)


### Name: ocProb
### Title: Probability trend for a continuous variable in an ordered choice
###   model
### Aliases: ocProb print.ocProb plot.ocProb
### Keywords: regression

### ** Examples

# Loading data from the MASS library
library(MASS)
data(housing) 
str(housing); head(housing)

# Fit an ordered choice model with polr from the MASS library
# Note this is a fake specification
# The variable of "Freq" is included to have a 
#   continuous variable for demonstration.
fm2 <- Sat ~ Infl + Type + Cont + Freq
rc <- polr(fm2, data = housing, Hess = TRUE, method = "probit")
rd <- polr(fm2, data = housing, Hess = TRUE, method = "logistic")
summary(rc); summary(rd)

# Compute predicated probabilities with one continous variable
(fa <- ocProb(w = rc, nam.c = 'Freq', n = 300))
(fb <- ocProb(w = rd, nam.c = 'Freq', n = 300))
plot(fa)
plot(fb) 



