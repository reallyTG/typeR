library(caRpools)


### Name: carpools.waterfall.pval
### Title: Visualization of p-value distribution
### Aliases: carpools.waterfall.pval
### Keywords: ~Analysis

### ** Examples

data(caRpools)

data.mageck = stat.mageck(untreated.list = list(CONTROL1, CONTROL2),
treated.list = list(TREAT1,TREAT2), namecolumn=1, fullmatchcolumn=2,
norm.fun="median", extractpattern=expression("^(.+?)(_.+)"),
mageckfolder=NULL, sort.criteria="neg", adjust.method="fdr",
filename = "TEST" , fdr.pval = 0.05)

carpools.waterfall.pval(type="mageck", dataset=data.mageck, pval=0.05, log=TRUE)



