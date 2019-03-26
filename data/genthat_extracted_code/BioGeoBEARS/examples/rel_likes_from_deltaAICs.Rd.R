library(BioGeoBEARS)


### Name: rel_likes_from_deltaAICs
### Title: Calculate the relative likelihoods of the models, from the
###   deltaAIC
### Aliases: rel_likes_from_deltaAICs

### ** Examples

test=1

AICvals = c(40, 50, 60)
deltaAICs = get_deltaAIC(AICvals)
deltaAICs

rel_likes_AIC = rel_likes_from_deltaAICs(deltaAICs)
rel_likes_AIC



