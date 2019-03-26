library(emmeans)


### Name: hpd.summary
### Title: Summarize an emmGrid from a Bayesian model
### Aliases: hpd.summary

### ** Examples

if(require("coda")) {
  # Create an emmGrid object from a system file
  cbpp.rg <- do.call(emmobj, 
      readRDS(system.file("extdata", "cbpplist", package = "emmeans")))
  hpd.summary(emmeans(cbpp.rg, "period"))
}




