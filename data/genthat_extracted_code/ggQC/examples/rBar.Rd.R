library(ggQC)


### Name: rBar
### Title: Mean Subgroup Range
### Aliases: rBar

### ** Examples

set.seed(5555)
df <- data.frame(v=rnorm(60, 0, 1), g=rep(c("A","B","C","D","E"), each=12))
rBar(data = df, formula = v~g)



