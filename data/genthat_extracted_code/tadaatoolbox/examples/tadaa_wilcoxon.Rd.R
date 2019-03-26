library(tadaatoolbox)


### Name: tadaa_wilcoxon
### Title: Tadaa, Wilcoxon!
### Aliases: tadaa_wilcoxon

### ** Examples

set.seed(42)
df <- data.frame(x = runif(100), y = sample(c("A", "B"), 100, TRUE))
tadaa_wilcoxon(df, x, y)

df <- data.frame(x = runif(100), y = c(rep("A", 50), rep("B", 50)))
tadaa_wilcoxon(df, x, y, paired = TRUE)



