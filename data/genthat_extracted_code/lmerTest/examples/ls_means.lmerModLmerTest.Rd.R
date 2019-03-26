library(lmerTest)


### Name: ls_means.lmerModLmerTest
### Title: LS-means for lmerTest Model Fits
### Aliases: ls_means.lmerModLmerTest lsmeansLT.lmerModLmerTest
###   difflsmeans.lmerModLmerTest

### ** Examples


# Get data and fit model:
data("cake", package="lme4")
model <- lmer(angle ~ recipe * temp + (1|recipe:replicate), cake)

# Compute LS-means:
ls_means(model)

# Get LS-means contrasts:
show_tests(ls_means(model))

# Compute pairwise differences of LS-means for each factor:
ls_means(model, pairwise=TRUE)
difflsmeans(model) # Equivalent.




