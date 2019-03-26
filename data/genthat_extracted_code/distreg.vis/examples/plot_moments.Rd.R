library(distreg.vis)


### Name: plot_moments
### Title: Plot function: Display the influence of a covariate
### Aliases: plot_moments

### ** Examples

library("gamlss")
dat <- model_fam_data(fam_name = "LOGNO")
model <- gamlss(LOGNO ~ ps(norm2) + binomial1,
                ~ ps(norm2) + binomial1,
                data = dat, family = "LOGNO")
ndata <- dat[sample(seq_len(nrow(dat)), 5), c("norm2", "binomial1")]
plot_moments(model, int_var = "norm2", pred_data = ndata)
plot_moments(model, int_var = "norm2", pred_data = ndata, rug = TRUE)



