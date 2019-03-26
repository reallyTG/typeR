library(ggQC)


### Name: sBar
### Title: Mean Subgroup Standard Deviation
### Aliases: sBar

### ** Examples

set.seed(5555)
df <- data.frame(v=rnorm(60, 0, 1), g=rep(c("A","B","C","D","E"), each=12))
sBar(data = df, formula = v~g)



