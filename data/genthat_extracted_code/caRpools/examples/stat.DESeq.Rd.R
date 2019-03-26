library(caRpools)


### Name: stat.DESeq
### Title: Analysis: DESeq2 Analysis of pooled CRISPR NGS data
### Aliases: stat.DESeq
### Keywords: ~kwd1 ~kwd2

### ** Examples


data(caRpools)
data.deseq = stat.DESeq(untreated.list = list(CONTROL1, CONTROL2),
  treated.list = list(TREAT1,TREAT2), namecolumn=1,
  fullmatchcolumn=2, extractpattern=expression("^(.+?)(_.+)"),
  sorting=FALSE, filename.deseq = "ANALYSIS-DESeq2-sgRNA.tab",
  fitType="parametric")
  
knitr::kable(data.deseq$genes[1:10,])




