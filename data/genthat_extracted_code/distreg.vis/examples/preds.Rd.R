library(distreg.vis)


### Name: preds
### Title: Predict distributional parameters of a bamlss family with a
###   bamlss model
### Aliases: preds

### ** Examples

# Generating data
data_fam <- model_fam_data(fam_name = "BE")
# Fit model
library("gamlss")
beta_model <- gamlss(BE ~ norm2 + binomial1,
  data = data_fam, family = BE())
# Get 3 predictions
pred_df <- data_fam[sample(1:nrow(data_fam), 3), c("binomial1", "norm2")]
param_preds <- preds(beta_model, pred_df)



