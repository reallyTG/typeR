library(caRpools)


### Name: stat.mageck
### Title: Analysis: Analysis of pooled CRISPR screening data using a
###   MAGeCK
### Aliases: stat.mageck
### Keywords: ~Analysis

### ** Examples

data(caRpools)
data.mageck = stat.mageck(untreated.list = list(CONTROL1, CONTROL2),
treated.list = list(TREAT1,TREAT2), namecolumn=1, fullmatchcolumn=2,
norm.fun="median", extractpattern=expression("^(.+?)(_.+)"),
mageckfolder=NULL, sort.criteria="neg", adjust.method="fdr",
filename = "TEST" , fdr.pval = 0.05)

knitr::kable(data.mageck$genes[1:10,])



