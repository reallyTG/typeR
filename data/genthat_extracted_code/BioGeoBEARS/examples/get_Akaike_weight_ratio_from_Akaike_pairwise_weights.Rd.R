library(BioGeoBEARS)


### Name: get_Akaike_weight_ratio_from_Akaike_pairwise_weights
### Title: Get the ratio between the pairwise Akaike Weights
### Aliases: get_Akaike_weight_ratio_from_Akaike_pairwise_weights

### ** Examples

test=1

AICvals = c(40, 50, 60)
deltaAICs = get_deltaAIC_pairwise_w_ref_model(AICvals, ref_model="best")
deltaAICs

rel_likes_AIC_pairwise = rel_likes_from_deltaAICs_pairwise(deltaAICs)
rel_likes_AIC_pairwise

Akaike_weights_pairwise = get_Akaike_weights_from_rel_likes_pairwise(
rel_likes_AIC_pairwise)
Akaike_weights_pairwise

Akaike_weight_ratios_pairwise = get_Akaike_weight_ratio_from_Akaike_pairwise_weights(
Akaike_weights_pairwise)
Akaike_weight_ratios_pairwise



