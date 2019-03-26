library(ggQC)


### Name: rMedian_UCL
### Title: Median of Subgroup Ranges Upper Control Limit (UCL)
### Aliases: rMedian_UCL

### ** Examples

set.seed(5555)
df <- data.frame(v=rnorm(60, 0, 1), g=rep(c("A","B","C","D","E"), each=12))
rMedian_UCL(data = df, formula = v~g)



