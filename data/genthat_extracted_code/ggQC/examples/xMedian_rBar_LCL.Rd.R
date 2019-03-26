library(ggQC)


### Name: xMedian_rBar_LCL
### Title: Mean of Subgroup Medians Lower Control Limit (LCL) based on Mean
###   Range
### Aliases: xMedian_rBar_LCL

### ** Examples

set.seed(5555)
df <- data.frame(v=rnorm(60, 0, 1), g=rep(c("A","B","C","D","E"), each=12))
xBar_rMedian_LCL(data = df, formula = v~g)



