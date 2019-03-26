library(ggQC)


### Name: rBar_UCL
### Title: Mean Subgroup Range Upper Control Limit (UCL)
### Aliases: rBar_UCL

### ** Examples

set.seed(5555)
df <- data.frame(v=rnorm(60, 0, 1), g=rep(c("A","B","C","D","E"), each=12))
rBar_UCL(data = df, formula = v~g)



