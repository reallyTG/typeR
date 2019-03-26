library(tadaatoolbox)


### Name: tadaa_t.test
### Title: Tadaa, t-Test!
### Aliases: tadaa_t.test

### ** Examples

set.seed(42)
df <- data.frame(x = runif(100), y = sample(c("A", "B"), 100, TRUE))
tadaa_t.test(df, x, y)

df <- data.frame(x = runif(100), y = c(rep("A", 50), rep("B", 50)))
tadaa_t.test(df, x, y, paired = TRUE)

tadaa_t.test(ngo, deutsch, geschl, print = "console")



