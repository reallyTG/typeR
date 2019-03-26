library(emmeans)


### Name: qdrg
### Title: Quick and dirty reference grid
### Aliases: qdrg

### ** Examples

if(require(coda) && require(lme4)) {
  # Use a stored example having a posterior sample
  # Model is based on the data in lme4::cbpp
  
  post <- readRDS(system.file("extdata", "cbpplist", package = "emmeans"))$post.beta
  rg1 <- qdrg(~ size + period, data = lme4::cbpp, mcmc = post, link = "logit")
  summary(rg1, type = "response")
}
if (require(biglm)) {
  bigmod <- biglm(log(conc) ~ source + factor(percent), data = pigs)
   
  rg2 <- qdrg(object = bigmod, data = pigs)
  summary(emmeans(rg2, "source"), type = "response")
}




