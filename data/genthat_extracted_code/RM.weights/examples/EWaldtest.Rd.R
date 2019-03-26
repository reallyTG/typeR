library(RM.weights)


### Name: EWaldtest
### Title: Wald test to check sampling independence under CML.
### Aliases: EWaldtest

### ** Examples

data(data.FAO_country3)
# Questionnaire data and weights
XX.country3 = data.FAO_country3[,1:8]
wt.country3 = data.FAO_country3$wt

# Split the sample in two random sub-samples
n = nrow(XX.country3)
samp1 = sample(1:n, n/2)
samp2 = setdiff(1:n, samp1)
# Fit two Rasch models on the two sub-samples
rr1 = RM.w(XX.country3[samp1, ], wt.country3[samp1])
rr2 = RM.w(XX.country3[samp2, ], wt.country3[samp2])
# Test sampling independence
EWaldtest(rr1$b, rr2$b, rr1$se.b, rr2$se.b)$tab



