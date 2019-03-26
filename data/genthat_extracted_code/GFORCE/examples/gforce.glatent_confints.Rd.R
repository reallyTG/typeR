library(GFORCE)


### Name: gforce.glatent_confints
### Title: Confidence Intervals for Estimation in G-Latent Models.
### Aliases: gforce.glatent_confints

### ** Examples

K <- 5
n <- 50
d <- 50
dat <- gforce.generator(K,d,n,3,graph='scalefree')
th_tilde <- gforce.glatent_confints(X_vals = dat$X,clusters = dat$group_assignments,
                                    use_cv = TRUE,graph='latent')




