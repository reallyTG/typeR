library(spatstat)


### Name: prune.rppm
### Title: Prune a Recursively Partitioned Point Process Model
### Aliases: prune.rppm
### Keywords: spatial models

### ** Examples

  # Murchison gold data
  mur <- solapply(murchison, rescale, s=1000, unitname="km")
  mur$dfault <- distfun(mur$faults)
  fit <- rppm(gold ~ dfault + greenstone, data=mur)
  fit
  prune(fit, cp=0.1)



