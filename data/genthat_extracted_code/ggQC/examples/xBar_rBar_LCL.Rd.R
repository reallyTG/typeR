library(ggQC)


### Name: xBar_rBar_LCL
### Title: Mean of Subgroup Means Lower Control Limit (LCL)
### Aliases: xBar_rBar_LCL

### ** Examples

set.seed(5555)
df <- data.frame(v=rnorm(60, 0, 1), g=rep(c("A","B","C","D","E"), each=12))
xBar_rBar_LCL(data = df, formula = v~g)



