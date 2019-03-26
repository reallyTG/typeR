library(pseudorank)


### Name: hettmansperger_norton_test
### Title: Hettmansperger-Norton Trend Test for k-Samples
### Aliases: hettmansperger_norton_test hettmansperger_norton_test.numeric
###   hettmansperger_norton_test.formula
### Keywords: export

### ** Examples

# create some data, please note that the group factor needs to be ordered
df <- data.frame(data = c(rnorm(40, 3, 1), rnorm(40, 2, 1), rnorm(20, 1, 1)),
  group = c(rep(1,40),rep(2,40),rep(3,20)))
df$group <- factor(df$group, ordered = TRUE)

# you can either test for a decreasing, increasing or custom trend
hettmansperger_norton_test(df$data, df$group, alternative="decreasing")
hettmansperger_norton_test(df$data, df$group, alternative="increasing")
hettmansperger_norton_test(df$data, df$group, alternative="custom", trend = c(1, 3, 2))



