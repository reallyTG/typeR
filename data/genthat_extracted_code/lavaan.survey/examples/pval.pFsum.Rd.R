library(lavaan.survey)


### Name: pval.pFsum
### Title: F test for model fit of complex survey structural equation
###   models
### Aliases: pval.pFsum
### Keywords: survey models regression robust multivariate

### ** Examples

# Load HolzingerSwineford1939 data
data("HolzingerSwineford1939")

# Create 43 fake clusters
HolzingerSwineford1939$fake.cluster <- rep(1:43, each=7)
# Create survey design object
des <- svydesign(ids=~fake.cluster, probs=~1, data=HolzingerSwineford1939)

# Show the design degrees of freedom: number of clusters - 1
degf(des) # 42

# A reduced factor model that has a larger p-value :
HS.model <- ' visual  =~ x2 + x3
  textual =~ x4 + x5 + x6'

# Fit the factor model without taking complex sampling into account
fit <- cfa(HS.model, data=HolzingerSwineford1939, estimator="MLMVS")

# Fit the factor model, taking the 43 clusters into account
fit.svy <- lavaan.survey(fit, survey.design=des, estimator="MLMVS")

# Calculate the F test p-value. 
# Since degf is only 42, there is a difference with Satterthwaite chi-square
pval.pFsum(fit.svy, survey.design=des)  # 0.0542468133




