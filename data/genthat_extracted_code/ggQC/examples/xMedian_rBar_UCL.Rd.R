library(ggQC)


### Name: xMedian_rBar_UCL
### Title: Mean of Subgroup Medians Upper Control Limit (UCL) based on mean
###   Range
### Aliases: xMedian_rBar_UCL

### ** Examples

set.seed(5555)
df <- data.frame(v=rnorm(60, 0, 1), g=rep(c("A","B","C","D","E"), each=12))
xMedian_rBar_UCL(data = df, formula = v~g)



