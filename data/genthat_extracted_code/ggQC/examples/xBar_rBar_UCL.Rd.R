library(ggQC)


### Name: xBar_rBar_UCL
### Title: Mean of Subgroup Means Upper Control Limit (UCL)
### Aliases: xBar_rBar_UCL

### ** Examples

set.seed(5555)
df <- data.frame(v=rnorm(60, 0, 1), g=rep(c("A","B","C","D","E"), each=12))
xBar_rBar_UCL(data = df, formula = v~g)



