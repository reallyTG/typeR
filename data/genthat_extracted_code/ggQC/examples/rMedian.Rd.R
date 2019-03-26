library(ggQC)


### Name: rMedian
### Title: Median of Subgroup Ranges
### Aliases: rMedian

### ** Examples

set.seed(5555)
df <- data.frame(v=rnorm(60, 0, 1), g=rep(c("A","B","C","D","E"), each=12))
rMedian(data = df, formula = v~g)



