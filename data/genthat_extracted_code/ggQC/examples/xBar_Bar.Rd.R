library(ggQC)


### Name: xBar_Bar
### Title: Mean of Subgroup Means
### Aliases: xBar_Bar

### ** Examples

set.seed(5555)
df <- data.frame(v=rnorm(60, 0, 1), g=rep(c("A","B","C","D","E"), each=12))
xBar_Bar(data = df, formula = v~g)



