library(wiqid)


### Name: allCombinations
### Title: Create formulae for all combinations of covariates
### Aliases: allCombinations

### ** Examples

longNames <- colnames(swiss)
# these would produce formulae too long for the console.
names(swiss) <- abbreviate(longNames)
vars <- colnames(swiss)
vars

# Get the formulae for all combinations of covars:
formulae <- allCombinations(vars[1], vars[-1])
formulae[1:10]

# Run all the models with 'lm', put results into a list:
# lms <- lapply(formulae, lm, data=swiss) # This works, but the call is a mess!
lms <- vector('list', 32)
for(i in 1:32)
  lms[[i]] <- lm(formulae[i], data=swiss)
names(lms) <- formulae

# Extract AICs and look at top model:
AICs <- sapply(lms, AIC)
head(sort(AICs))
lms[[which.min(AICs)]]

# Do a nice table of results:
DeltaAIC <- AICs - min(AICs)
AICllh <- exp(-DeltaAIC/2)
AICwt <- AICllh / sum(AICllh)
order <- order(AICs)
head(round(cbind(AIC=AICs, DeltaAIC, AICllh, AICwt)[order, ], 3))

# Get AIC weights for each of the covars:
is.in <- allCombinations(vars[1], vars[-1], form=FALSE)
head(is.in)   # shows which covars are in each model
covarWts <- AICwt %*% is.in
round(sort(covarWts[1, ], dec=TRUE), 3)
  # the [1, ] is needed because %*% returns a 1-row matrix; 'sort' will coerce
  #   that to a vector but strips out the names in the process.



