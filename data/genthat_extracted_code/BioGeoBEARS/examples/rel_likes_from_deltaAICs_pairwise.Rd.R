library(BioGeoBEARS)


### Name: rel_likes_from_deltaAICs_pairwise
### Title: Calculate the relative likelihoods of the models, from the
###   deltaAICs, pairwise
### Aliases: rel_likes_from_deltaAICs_pairwise

### ** Examples

test=1

AICvals = c(40, 50, 60)
deltaAICs = get_deltaAIC_pairwise_w_ref_model(AICvals, ref_model="best")
deltaAICs

rel_likes_AIC_pairwise = rel_likes_from_deltaAICs_pairwise(deltaAICs)
rel_likes_AIC_pairwise



