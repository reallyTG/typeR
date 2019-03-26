library(qpcR)


### Name: evidence
### Title: Evidence ratio for model comparisons with AIC, AICc or BIC
### Aliases: evidence
### Keywords: models nonlinear

### ** Examples

## Compare two four-parameter and five-parameter
## log-logistic models.
m1 <- pcrfit(reps, 1, 2, l4)
m2 <- pcrfit(reps, 1, 2, l5)
evidence(m2, m1)

## Ratio of two AIC's.
evidence(-120, -123)



