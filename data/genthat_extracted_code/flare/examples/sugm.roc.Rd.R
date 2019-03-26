library(flare)


### Name: sugm.roc
### Title: Draw ROC Curve for an object with S3 class '"sugm"'
### Aliases: sugm.roc

### ** Examples

## load package required
library(flare)

#generate data
L = sugm.generator(d = 30, graph = "random", prob = 0.1)
out1 = sugm(L$data, lambda=10^(seq(log10(.4), log10(0.03), length.out=20)))

#draw ROC curve
Z1 = sugm.roc(out1$path,L$theta)

#Maximum F1 score
max(Z1$F1)



