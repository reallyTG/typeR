library(caRpools)


### Name: stat.wilcox
### Title: Analysis: Analysis of pooled CRISPR screening data using a
###   Wilcoxon Test
### Aliases: stat.wilcox
### Keywords: ~Analysis

### ** Examples

data(caRpools)

data.wilcox = stat.wilcox(untreated.list = list(CONTROL1, CONTROL2),
  treated.list = list(TREAT1,TREAT2), namecolumn=1, fullmatchcolumn=2,
  normalize=TRUE, norm.fun=median, sorting=FALSE, controls="random",
  control.picks=NULL)
  
knitr::kable(data.wilcox[1:10,])



