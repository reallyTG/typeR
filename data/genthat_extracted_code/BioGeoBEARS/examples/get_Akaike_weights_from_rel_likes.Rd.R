library(BioGeoBEARS)


### Name: get_Akaike_weights_from_rel_likes
### Title: Calculate the Akaike Weights, from the relative likelihoods of
###   the models
### Aliases: get_Akaike_weights_from_rel_likes

### ** Examples

test=1

AICvals = c(40, 50, 60)
deltaAICs = get_deltaAIC(AICvals)
deltaAICs

Akaike_weights = rel_likes_from_deltaAICs(deltaAICs)
Akaike_weights



