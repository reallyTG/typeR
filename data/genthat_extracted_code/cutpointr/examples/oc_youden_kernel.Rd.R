library(cutpointr)


### Name: oc_youden_kernel
### Title: Determine an optimal cutpoint maximizing the Youden-Index based
###   on kernel smoothed densities
### Aliases: oc_youden_kernel

### ** Examples

data(suicide)
if (require(KernSmooth)) {
  oc_youden_kernel(suicide, "dsi", "suicide", oc_metric = "Youden",
  pos_class = "yes", neg_class = "no", direction = ">=")
  ## Within cutpointr
  cutpointr(suicide, dsi, suicide, method = oc_youden_kernel)
}



