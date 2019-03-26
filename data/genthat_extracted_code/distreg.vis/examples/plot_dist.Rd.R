library(distreg.vis)


### Name: plot_dist
### Title: Plot predicted bamlss distribution families with ggplot2
### Aliases: plot_dist

### ** Examples

# Generating data
data_fam <- model_fam_data(fam_name = "BE")
# Fit model
library("gamlss")
beta_model <- gamlss(BE ~ norm2 + binomial1,
  data = data_fam, family = BE())
# Get 3 predictions
pred_df <- data_fam[sample(1:nrow(data_fam), 3), c("norm2", "binomial1")]
param_preds <- preds(beta_model, pred_df)
# Create pdf, cdf plots
plot_dist(beta_model, param_preds, rug = TRUE)



