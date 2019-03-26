library(tcgsaseq)


### Name: baduel_5gs
### Title: Small portion of RNA-seq data from plant physiology study.
### Aliases: baduel_5gs baduel baduel_gmt design expr_norm_corr
### Keywords: datasets

### ** Examples

## Not run: 
##D rm(list=ls())
##D data("baduel_5gs")
##D 
##D set.seed(54321)
##D KAvsTBG <- tcgsa_seq(y=log2(expr_norm_corr+1), x=apply(as.matrix(design[, c("Intercept",
##D    "Vernalized", "Age_weeks", "Vernalized_Population", "AgeWeeks_Population"), drop=FALSE]),
##D        2, as.numeric),
##D                      phi=as.matrix(design[, c("PopulationKA"), drop=FALSE]),
##D                      genesets=baduel_gmt$genesets[c(3,5)],
##D                      which_test = "permutation", which_weights = "loclin",
##D                      n_perm=1000, preprocessed = TRUE, doPlot = TRUE)
##D 
##D set.seed(54321)
##D Cold <- tcgsa_seq(y=log2(expr_norm_corr+1), x=apply(as.matrix(design[, c("Intercept",
##D    "Age_weeks", "PopulationKA", "AgeWeeks_Population"), drop=FALSE]), 2, as.numeric),
##D                  phi=as.matrix(design[, c("Vernalized", "Vernalized_Population")]),
##D                  genesets=baduel_gmt$genesets[c(3,5)],
##D                  which_test = "permutation", which_weights = "loclin",
##D                  n_perm=1000, preprocessed = TRUE, doPlot = TRUE)
## End(Not run)





