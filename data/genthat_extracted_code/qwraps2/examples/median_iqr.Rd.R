library(qwraps2)


### Name: median_iqr
### Title: Median and Inner Quartile Range
### Aliases: median_iqr

### ** Examples

set.seed(42)
x <- rnorm(1000, 3, 4)
median(x)
quantile(x, probs = c(1, 3)/4)
median_iqr(x)
median_iqr(x, show_n = "always")

x[187] <- NA
# median_iqr(x) ## Will error
median_iqr(x, na_rm = TRUE)





