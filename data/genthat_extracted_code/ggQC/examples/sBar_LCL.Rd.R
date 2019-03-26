library(ggQC)


### Name: sBar_LCL
### Title: Mean Subgroup Standard Deviation Lower Control Limit (LCL)
### Aliases: sBar_LCL

### ** Examples

set.seed(5555)
df <- data.frame(v=rnorm(60, 0, 1), g=rep(c("A","B","C","D","E"), each=12))
sBar_LCL(data = df, formula = v~g)



