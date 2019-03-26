library(caRpools)


### Name: final.table
### Title: CaRpools: Generating Table with Analysis Information from all
###   Methods
### Aliases: final.table
### Keywords: ~Output

### ** Examples

data(caRpools)
data.wilcox = stat.wilcox(untreated.list = list(CONTROL1, CONTROL2),
  treated.list = list(TREAT1,TREAT2), namecolumn=1, fullmatchcolumn=2,
  normalize=TRUE, norm.fun=median, sorting=FALSE, controls="random",
  control.picks=NULL)
  
data.deseq = stat.DESeq(untreated.list = list(CONTROL1, CONTROL2),
  treated.list = list(TREAT1,TREAT2), namecolumn=1,
  fullmatchcolumn=2, extractpattern=expression("^(.+?)(_.+)"),
  sorting=FALSE, filename.deseq = "ANALYSIS-DESeq2-sgRNA.tab",
  fitType="parametric")
  
data.mageck = stat.mageck(untreated.list = list(CONTROL1, CONTROL2),
treated.list = list(TREAT1,TREAT2), namecolumn=1, fullmatchcolumn=2,
norm.fun="median", extractpattern=expression("^(.+?)(_.+)"), mageckfolder=NULL,
sort.criteria="neg", adjust.method="fdr", filename = "TEST" , fdr.pval = 0.05)

final.tab = final.table(wilcox=data.wilcox, deseq=data.deseq,
mageck=data.mageck, dataset=CONTROL1.g, namecolumn=1, type="genes")
knitr::kable(final.tab[1:20,])



