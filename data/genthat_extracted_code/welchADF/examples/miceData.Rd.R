library(welchADF)


### Name: miceData
### Title: Number of visits and time spent in different tunnels of
###   laboratory mice
### Aliases: miceData
### Keywords: datasets

### ** Examples

omnibus_LSM <- welchADF.test(miceData, response = c("visits", "time", "latency"),
  between.s = "nurs", within.s = "tunnel", subject = "Subject", contrast = "omnibus")
# Formula interface, using cbind() to specify a multivariate response.
omnibus_LSM_formula <- welchADF.test(
  cbind(visits, time, latency) ~ nurs*tunnel + (tunnel|Subject), data = miceData) 
pairwise_LSM_nurs <- welchADF.test(miceData, response = c("visits", "time",
  "latency"), between.s = "nurs", within.s = "tunnel", subject = "Subject",
  effect = "nurs", contrast = "all.pairwise")
pairwise_LSM_tunnel <- update(pairwise_LSM_nurs, effect = "tunnel")
## Not run: 
##D   pairwise_nurs_trimmed_boot <- update(pairwise_LSM_nurs, trimming = TRUE, bootstrap = TRUE)
##D   pairwise_tunnel_trimmed_boot <- update(pairwise_nurs_trimmed_boot, effect = "tunnel")
##D   summary(pairwise_nurs_trimmed_boot)
## End(Not run)
summary(omnibus_LSM)
summary(pairwise_LSM_nurs)
summary(pairwise_LSM_tunnel)



