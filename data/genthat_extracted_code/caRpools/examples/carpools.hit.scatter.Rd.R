library(caRpools)


### Name: carpools.hit.scatter
### Title: Plot: Plotting Scatters for hit candidate genes for all provided
###   sampled
### Aliases: carpools.hit.scatter
### Keywords: ~Analysis Visualization

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
norm.fun="median", extractpattern=expression("^(.+?)(_.+)"),
mageckfolder=NULL, sort.criteria="neg", adjust.method="fdr",
filename = "TEST" , fdr.pval = 0.05)

#Single Gene
plothitsscatter.enriched = carpools.hit.scatter(wilcox=data.wilcox,
deseq=data.deseq, mageck=data.mageck, dataset=list(TREAT1, TREAT2, CONTROL1, CONTROL2),
dataset.names = c(d.TREAT1, d.TREAT2, d.CONTROL1, d.CONTROL2),
namecolumn=1, fullmatchcolumn=2, title="Title", labelgenes="CASP8",
labelcolor="orange", extractpattern=expression("^(.+?)(_.+)"),
normalize=TRUE, norm.function=median, offsetplot=1.2, center=FALSE,
aggregated=FALSE, type="enriched", cutoff.deseq = 0.001,
cutoff.wilcox = 0.05, cutoff.mageck = 0.05, cutoff.override=FALSE,
cutoff.hits=NULL,  pch=16)

#Overlapping candidate genes

plothitsscatter.enriched = carpools.hit.scatter(wilcox=data.wilcox,
deseq=data.deseq, mageck=data.mageck, dataset=list(TREAT1, TREAT2, CONTROL1, CONTROL2),
dataset.names = c(d.TREAT1, d.TREAT2, d.CONTROL1, d.CONTROL2), namecolumn=1,
fullmatchcolumn=2, title="Title", labelgenes=NULL, labelcolor="orange",
extractpattern=expression("^(.+?)(_.+)"), normalize=TRUE, norm.function=median,
offsetplot=1.2, center=FALSE, aggregated=FALSE, type="enriched",
cutoff.deseq = 0.001, cutoff.wilcox = 0.05, cutoff.mageck = 0.05,
cutoff.override=FALSE, cutoff.hits=NULL,  pch=16)




