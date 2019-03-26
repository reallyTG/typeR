library(dejaVu)


### Name: Simfit
### Title: S3 generic for fitting models
### Aliases: Simfit

### ** Examples

 
set.seed(1234)
sim <- SimulateComplete(study.time=1,number.subjects=50,
      event.rates=c(0.1,0.05),dispersions=0.1)
summary(Simfit(sim,equal.dispersion=TRUE))





