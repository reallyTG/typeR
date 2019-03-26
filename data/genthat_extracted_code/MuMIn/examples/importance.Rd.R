library(MuMIn)


### Name: importance
### Title: Relative variable importance
### Aliases: importance
### Keywords: models

### ** Examples


# Generate some models
fm1 <- lm(y ~ ., data = Cement, na.action = na.fail)
ms1 <- dredge(fm1)

# Importance can be calculated/extracted from various objects:
importance(ms1)
## Not run: 
##D importance(subset(model.sel(ms1), delta <= 4))
##D importance(model.avg(ms1, subset = delta <= 4))
##D importance(subset(ms1, delta <= 4))
##D importance(get.models(ms1, delta <= 4))
## End(Not run)

# Re-evaluate the importances according to BIC
# note that re-ranking involves fitting the models again

# 'nobs' is not used here for backwards compatibility
lognobs <- log(length(resid(fm1)))

importance(subset(model.sel(ms1, rank = AIC, rank.args = list(k = lognobs)),
    cumsum(weight) <= .95))

# This gives a different result than previous command, because 'subset' is
# applied to the original selection table that is ranked with 'AICc'
importance(model.avg(ms1, rank = AIC, rank.args = list(k = lognobs),
    subset = cumsum(weight) <= .95))




