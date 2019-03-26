library(BioGeoBEARS)


### Name: get_deltaAIC_pairwise_w_ref_model
### Title: Calculate deltaAIC
### Aliases: get_deltaAIC_pairwise_w_ref_model

### ** Examples

test=1

AICvals = c(40, 50, 60)
get_deltaAIC(AICvals)
get_deltaAIC_pairwise_w_ref_model(AICvals, ref_model="best")



