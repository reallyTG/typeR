library(QQperm)


### Name: qqplot
### Title: QQ plot of observed P-values vs expected P-values, using the
###   empirical (permutation-based) expected p-value distribution. This
###   empirical-based expected p-value distribution no longer depends on an
###   assumption that the Fisher's Exact two-tailed p-values are uniformly
###   distributed under the null. For a given matrix, the permutation-based
###   expected distribution is plotted relative to the observed order
###   statistic to get the permutation-based QQ plot.
### Aliases: qqplot

### ** Examples

library(QQperm)
data("example.Ps")

#print output to pdf file only if not running in interactive mode
if (!interactive()) {
 pdf("qqplot.pdf")
}

qqplot(example.Ps$perm, example.Ps$observed)

if (!interactive()) {
 dev.off()
}



