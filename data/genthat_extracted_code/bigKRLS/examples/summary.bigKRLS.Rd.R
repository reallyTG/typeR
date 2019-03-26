library(bigKRLS)


### Name: summary.bigKRLS
### Title: summary.bigKRLS
### Aliases: summary.bigKRLS

### ** Examples

# y <- as.matrix(ChickWeight$weight)
# X <- matrix(cbind(ChickWeight$Time, ChickWeight$Diet == 1), ncol = 2)
# out <- bigKRLS(y, X, Ncores=1)
# summary(out)
# s = summary(out, digits = 2, labs = c("Time", "ChickWeightDiet"))
# knitr::kable(s[["ttests"]])     # to format with RNotebook or RMarkdown
# knitr::kable(s[["percentiles"]])
# summary(out, degrees = "N")     # don't adjust p value for cost of lambda. See above.



