library(prefmod)


### Name: llbtPC.fit
### Title: Function to fit a loglinear Bradley-Terry model for paired
###   comparisons
### Aliases: llbtPC.fit
### Keywords: models multivariate

### ** Examples

# cems universities example
res0 <- llbtPC.fit(cemspc, nitems = 6, formel = ~1,   elim = ~ENG, undec = TRUE)
res1 <- llbtPC.fit(cemspc, nitems = 6, formel = ~ENG, elim = ~ENG, undec = TRUE)

anova(res1, res0)
llbt.worth(res1)



