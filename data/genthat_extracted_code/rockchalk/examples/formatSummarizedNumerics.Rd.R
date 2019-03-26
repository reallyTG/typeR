library(rockchalk)


### Name: formatSummarizedNumerics
### Title: Reformat numeric summarize output as one column per variable,
###   similar to R summary
### Aliases: formatSummarizedNumerics

### ** Examples

set.seed(21234)
X <- matrix(rnorm(10000), ncol = 10, dimnames = list(NULL, paste0("xvar", 1:10)))
Xsum <- summarize(X)
Xsum$numerics
formatSummarizedNumerics(Xsum$numerics)
formatSummarizedNumerics(Xsum$numerics, digits = 5)
Xsum.fmt <- formatSummarizedNumerics(Xsum$numerics)
str(Xsum.fmt)



