library(RM.weights)


### Name: prob.assign
### Title: Probabilistic assignment of cases to classes of severity along
###   the latent trait.
### Aliases: prob.assign

### ** Examples

data(data.FAO_country1)
# Questionnaire data and weights
XX.country1 = data.FAO_country1[,1:8]
wt.country1 = data.FAO_country1$wt
# Fit weighted Rasch
rr.country1 = RM.w(XX.country1, wt.country1)

# Thresholds on the latent trait corresponding to a given raw score
pp.country1 = prob.assign(rr.country1, rwthres = c(3, 7))

# Table with prevalences and thresholds
tab = cbind("Raw score" = c(3, 7), "Latent trait" =  pp.country1$thres, 
"Prevalence" = colSums(pp.country1$f))
rownames(tab) = c("Thres 1","Thres 2")
tab

# Pre-defined thresholds on the latent trait
sthresh = c(-0.25, 1.81)
pp.country1.2 = prob.assign(rr.country1, sthres = sthresh)$sprob
# Probability of being beyond -0.25 on the latent trait in country 1 
pp.country1.2[1]*100
# Probability of being beyond 1.81 on the latent trait in country 1 
pp.country1.2[2]*100

# More than 2 extremes
# Fit the model
rr.country1.d = RM.w(XX.country1, wt.country1, .d = c(0.5, 7.5, 7.7))
# Probabilistic assignment
pp.country1.d = prob.assign(rr.country1.d, sthres = sthresh)$sprob
# Probability of being beyond -0.25 on the latent trait in country 1 
# using upper assumption on the extreme raw score parameter 8
pp.country1.d[[1]]*100
# Probability of being beyond -0.25 on the latent trait in country 1 
# using lower assumption on the extreme raw score parameter 8
pp.country1.d[[2]]*100



