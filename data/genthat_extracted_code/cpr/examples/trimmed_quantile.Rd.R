library(cpr)


### Name: trimmed_quantile
### Title: Trimmed Quantiles
### Aliases: trimmed_quantile

### ** Examples

trimmed_quantile(1:100, prob = 1:23 / 24, name = FALSE)

# Warning
# trimmed_quantile(1:100, trim = .3, prob = 1:23 / 24, name = FALSE)

# no warning
trimmed_quantile(1:100, trim = 3, prob = 1:23 / 24, name = FALSE)




