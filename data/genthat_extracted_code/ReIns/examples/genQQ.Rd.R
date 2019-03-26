library(ReIns)


### Name: genQQ
### Title: Generalised quantile plot
### Aliases: genQQ generalizedQQ

### ** Examples

data(soa)

# Compute Hill estimator
H <- Hill(soa$size[1:5000], plot=FALSE)$gamma

# Generalised QQ-plot
genQQ(soa$size[1:5000], gamma=H)



