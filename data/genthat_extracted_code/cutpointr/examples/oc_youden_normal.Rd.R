library(cutpointr)


### Name: oc_youden_normal
### Title: Determine an optimal cutpoint for the Youden-Index assuming
###   normal distributions
### Aliases: oc_youden_normal

### ** Examples

data(suicide)
oc_youden_normal(suicide, "dsi", "suicide",
  pos_class = "yes", neg_class = "no", direction = ">=")
cutpointr(suicide, dsi, suicide, method = oc_youden_normal)



