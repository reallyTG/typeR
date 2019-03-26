library(RM.weights)


### Name: PC.w
### Title: Estimation of the weighted partial credit model using CML
### Aliases: PC.w

### ** Examples

data(data.FAO_country1)
# Questionnaire data and weights
XX.country1 = data.FAO_country1[,1:8]
XX.country1[,c(7,8)] = cbind(rbinom(nrow(XX.country1), 3, .5), rbinom(nrow(XX.country1), 3, .4)) 
wt.country1 = data.FAO_country1$wt
# Fit weighted partial credit model with aggregation of the two more severe categories
rr.country1.pol2 = PC.w(XX.country1, wt.country1, recode = 1)



