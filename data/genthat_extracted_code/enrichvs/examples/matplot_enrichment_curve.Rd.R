library(enrichvs)


### Name: matplot_enrichment_curve
### Title: Function to plot multiple enrichment curves for virtual
###   screening
### Aliases: matplot_enrichment_curve

### ** Examples

x <- matrix(rnorm(5000), ncol=5)  # random 5 scores for 1000 compounds
y <- c(rep(1,50), rep(0,950))     # activity labels for "x"
matplot_enrichment_curve(x, y)



