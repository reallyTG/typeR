library(hamlet)


### Name: orxlong
### Title: Long-format longitudinal data for the ORX study
### Aliases: orxlong
### Keywords: datasets

### ** Examples

data(orxlong)
# Construct data frames that can be used for testing pairwise group contrasts
orxintact <- orxlong[orxlong[,"Intact"]==1 | orxlong[,"ORX"]==1, 
	c("PSA", "ID", "ORX", "TrDay", "Submatch")]
orxtx <- orxlong[orxlong[,"ORXTx"]==1 | orxlong[,"ORX"]==1, 
	c("PSA", "ID", "ORXTx", "TrDay", "Submatch")]
# Include only observations occurring post-surgery
orxintact <- orxintact[orxintact[,"TrDay"]>=0,]
orxtx <- orxtx[orxtx[,"TrDay"]>=0,]

# Example fits
library(lme4)
library(lmerTest)
# Conventional model fits
fit1a <- lmer(PSA ~ 1 + TrDay + ORXTx:TrDay + (1|ID) + (0 + TrDay|ID), data = orxtx)
fit1b <- lmer(PSA ~ 1 + TrDay + ORXTx:TrDay + (1 + TrDay|ID), data = orxtx)
fit2a <- lmer(PSA ~ 1 + TrDay + ORX:TrDay + (1|ID) + (0 + TrDay|ID), data = orxintact)
fit2b <- lmer(PSA ~ 1 + TrDay + ORX:TrDay + (1 + TrDay|ID), data = orxintact)

# Collate to matched inference for pairwise observations over the submatches
matched.orx <- do.call("rbind", by(orxintact, INDICES=orxintact[,"Submatch"], FUN=function(z){
	z[,"MatchedPSA"] <- z[,"PSA"] - z[z[,"ORX"]==0,"PSA"]
	z <- z[z[,"ORX"]==1,]
	z
}))
# Few examples of matched fits with different model formulations
fit.matched.1 <- lmer(MatchedPSA ~ 0 + TrDay + (1|ID) + (0 + TrDay|ID), data = matched.orx)
fit.matched.2 <- lmer(MatchedPSA ~ 1 + TrDay + (1|ID) + (0 + TrDay|ID), data = matched.orx)
fit.matched.3 <- lmer(MatchedPSA ~ 1 + TrDay + (1 + TrDay|ID), data = matched.orx)
summary(fit.matched.1)
summary(fit.matched.2)
summary(fit.matched.3)
# We notice that the intercept term is highly insignificant 
# if included in the matched model, as expected by baseline balance.
# In contrast, the matched intervention growth coefficient is highly
# statistically significant in each of the models.



