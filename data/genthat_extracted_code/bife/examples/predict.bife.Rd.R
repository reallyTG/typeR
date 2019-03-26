library(bife)


### Name: predict.bife
### Title: Computes Predicted Probabilities
### Aliases: predict.bife

### ** Examples

library("bife")

# Load 'psid' dataset
dataset <- psid
head(dataset)

# Fixed effects logit model w/o bias-correction
mod_no <- bife(LFP ~ AGE + I(INCH / 1000) + KID1 + KID2 + KID3 | ID, 
 data = dataset, bias_corr = "no")
 
# Compute predicted probabilities based on the regressor matrix
# and fixed effects stored in 'mod_no'
prob <- predict(mod_no)

# Compute predicted probabilities based on the regressor matrix
# and all fixed effects set to zero
prob_zero <- predict(mod_no, alpha_new = 0.0)




