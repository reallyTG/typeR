library(difconet)


### Name: difconet.plot.histograms.heatmap2
### Title: PLOT A HEATMAP REPRESENTATION OF THE DISTRIBUTION OF
###   CORRELATIONS OF MANY GENES
### Aliases: difconet.plot.histograms.heatmap2

### ** Examples


xdata <- matrix(rnorm(1000), ncol=100)
xpredictor <- sample(c("A","B","C","D"),100,replace=TRUE)
dObj <- difconet.run(xdata, xpredictor, metric = 4, num_perms = 10,              
  comparisons = list(c("A","D"), c("A","B"), c("B","D")),
  perm_mode = "columns")

  #Top highest metric in first comparison but showing correlations in only 3 stages
  difconet.plot.gene.correlations(dObj, order(dObj$combstats[[1]][,"M4.dist"], 
    decreasing=TRUE)[1], type="s", stages=1:3)
  #Bottom lowest metric in second comparison showing all stages
  difconet.plot.gene.correlations(dObj, order(dObj$combstats[[2]][,"M4.dist"], 
    decreasing=TRUE)[1], type="d")
  #Another specific gene (1), showing densities of correlations
  difconet.plot.gene.correlations(dObj, 1, type="d")



