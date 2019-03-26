library(cutpointr)


### Name: oc_mean
### Title: Use the sample mean as cutpoint
### Aliases: oc_mean

### ** Examples

data(suicide)
oc_mean(suicide, "dsi")
cutpointr(suicide, dsi, suicide, method = oc_mean)



