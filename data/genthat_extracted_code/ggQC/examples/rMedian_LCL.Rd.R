library(ggQC)


### Name: rMedian_LCL
### Title: Median of Subgroup Ranges Lower Control Limit (LCL)
### Aliases: rMedian_LCL

### ** Examples

set.seed(5555)
df <- data.frame(v=rnorm(60, 0, 1), g=rep(c("A","B","C","D","E"), each=12))
rMedian_LCL(data = df, formula = v~g)



