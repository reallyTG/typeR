library(Repliscope)


### Name: plotBed
### Title: A function to boxplot 'score' column of a BED dataframe, per
###   unique chromosome name in the ‘chrom’ column. The resulting plot also
###   highlights outliers based on the inter quartile range (IQR). The
###   genome wide median is plotted as a pink line through the boxplots.
### Aliases: plotBed
### Keywords: BED bioinformatics boxplot genomics

### ** Examples

plotBed(W303_S)
plotObject <- plotBed(W303_G2,plotting=FALSE)



