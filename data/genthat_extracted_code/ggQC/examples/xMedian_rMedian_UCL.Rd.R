library(ggQC)


### Name: xMedian_rMedian_UCL
### Title: Mean of Subgroup Medians Upper Control Limit (UCL) based on
###   Median Range
### Aliases: xMedian_rMedian_UCL

### ** Examples

set.seed(5555)
df <- data.frame(v=rnorm(60, 0, 1), g=rep(c("A","B","C","D","E"), each=12))
xMedian_rMedian_UCL(data = df, formula = v~g)



