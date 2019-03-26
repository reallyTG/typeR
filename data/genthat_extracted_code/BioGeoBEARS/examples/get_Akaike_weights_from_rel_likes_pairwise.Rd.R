library(BioGeoBEARS)


### Name: get_Akaike_weights_from_rel_likes_pairwise
### Title: Calculate the Akaike Weights, from the relative likelihoods of
###   the models
### Aliases: get_Akaike_weights_from_rel_likes_pairwise

### ** Examples

test=1

AICvals = c(40, 50, 60)
deltaAICs = get_deltaAIC_pairwise_w_ref_model(AICvals, ref_model="best")
deltaAICs

rel_likes_AIC_pairwise = rel_likes_from_deltaAICs_pairwise(deltaAICs)
rel_likes_AIC_pairwise

Akaike_weights_pairwise = get_Akaike_weights_from_rel_likes_pairwise(rel_likes_AIC_pairwise)
Akaike_weights_pairwise



