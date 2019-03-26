library(metaSEM)


### Name: homoStat
### Title: Test the Homogeneity of Effect Sizes
### Aliases: homoStat
### Keywords: meta-analysis

### ** Examples

with( Hox02, homoStat(yi, vi) )

with( HedgesOlkin85, homoStat(y=cbind(d_att, d_ach),
      v=cbind(var_att, cov_att_ach, var_ach)) )



