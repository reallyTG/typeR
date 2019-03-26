library(itsadug)


### Name: get_coefs
### Title: Get coefficients for the parametric terms (intercepts and random
###   slopes).
### Aliases: get_coefs

### ** Examples

data(simdat)

# Condition as factor, to have a random intercept
# for illustration purposes:
simdat$Condition <- as.factor(simdat$Condition)

# Model with random effect and interactions:
m1 <- bam(Y ~ Group * Condition + s(Time),
    data=simdat)

# extract all parametric coefficients:
get_coefs(m1)
# calculate t-values:
test <- get_coefs(m1)
test <- cbind(test, test[,1] / test[,2] )
colnames(test)[3] <- 't-value'
test

# get_coefs returns the same numbers as shown in the parametric summary:
summary(m1)
# get_coefs is based on the function coef. This function returns 
# values of all coefficients, and does not provide SE:
coef(m1)




