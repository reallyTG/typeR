library(qtlcharts)


### Name: iboxplot
### Title: Modern boxplot linked to underlying histrograms
### Aliases: iboxplot
### Keywords: hplot

### ** Examples

n.ind <- 500
n.gene <- 10000
expr <- matrix(rnorm(n.ind * n.gene, (1:n.ind)/n.ind*3), ncol=n.gene)
dimnames(expr) <- list(paste0("ind", 1:n.ind),
                       paste0("gene", 1:n.gene))
## No test: 
iboxplot(expr, chartOpts=list(xlab="Mice", ylab="Gene expression"))
## End(No test)




