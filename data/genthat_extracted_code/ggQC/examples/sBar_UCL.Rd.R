library(ggQC)


### Name: sBar_UCL
### Title: Mean Subgroup Standard Deviation Upper Control Limit (UCL)
### Aliases: sBar_UCL

### ** Examples

set.seed(5555)
df <- data.frame(v=rnorm(60, 0, 1), g=rep(c("A","B","C","D","E"), each=12))
sBar_UCL(data = df, formula = v~g)



