library(ggQC)


### Name: xMedian_Bar
### Title: Mean of Subgroup Medians
### Aliases: xMedian_Bar

### ** Examples

set.seed(5555)
df <- data.frame(v=rnorm(60, 0, 1), g=rep(c("A","B","C","D","E"), each=12))
xMedian_Bar(data = df, formula = v~g)



