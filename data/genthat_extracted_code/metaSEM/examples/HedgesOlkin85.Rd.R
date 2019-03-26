library(metaSEM)


### Name: HedgesOlkin85
### Title: Effects of Open Education Reported by Hedges and Olkin (1985)
### Aliases: HedgesOlkin85
### Keywords: datasets

### ** Examples

data(HedgesOlkin85)

## Fixed-effects meta-analysis
summary( meta(y=cbind(d_att, d_ach),
              v=cbind(var_att, cov_att_ach, var_ach),
              data=HedgesOlkin85,
              RE.constraints=matrix(0, nrow=2, ncol=2)) )



