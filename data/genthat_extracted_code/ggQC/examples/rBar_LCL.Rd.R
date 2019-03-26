library(ggQC)


### Name: rBar_LCL
### Title: Mean Subgroup Range Lower Control Limit (LCL)
### Aliases: rBar_LCL

### ** Examples

set.seed(5555)
df <- data.frame(v=rnorm(60, 0, 1), g=rep(c("A","B","C","D","E"), each=12))
rBar_LCL(data = df, formula = v~g)



