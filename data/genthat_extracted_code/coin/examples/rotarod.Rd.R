library(coin)


### Name: rotarod
### Title: Rotating Rats
### Aliases: rotarod
### Keywords: datasets

### ** Examples

## One-sided exact Wilcoxon-Mann-Whitney test (p = 0.0186)
wilcox_test(time ~ group, data = rotarod, distribution = "exact",
            alternative = "greater")

## Two-sided exact Wilcoxon-Mann-Whitney test (p = 0.0373)
wilcox_test(time ~ group, data = rotarod, distribution = "exact")

## Two-sided asymptotic Wilcoxon-Mann-Whitney test (p = 0.0147)
wilcox_test(time ~ group, data = rotarod)



