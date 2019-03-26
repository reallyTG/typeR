library(IDetect)


### Name: resid_ID
### Title: Calculate the residuals related to the estimated signal
### Aliases: resid_ID

### ** Examples

single.cpt.pcm <- c(rep(4,1000),rep(0,1000))
single.cpt.pcm.noise <- single.cpt.pcm + rnorm(2000)
cpt_detect <- ID(single.cpt.pcm.noise, contrast = "mean")

residuals_cpt_raw <- resid_ID(single.cpt.pcm.noise, cpt = cpt_detect$cpt, type_chg = "mean",
type_res = "raw")

residuals_cpt_stand. <- resid_ID(single.cpt.pcm.noise, cpt = cpt_detect$cpt, type_chg = "mean",
type_res = "standardised")

plot(residuals_cpt_raw)
plot(residuals_cpt_stand.)



