library(iDINGO)


### Name: idingo
### Title: Fit iDINGO model
### Aliases: idingo

### ** Examples

data(brca)

# Run iDINGO with microRNA, RNA, and protein data.
# Generally, we recommend a minimum of 100 bootstraps.
## Not run: 
##D fit <- idingo(brca$mirna, dat2 = brca$rna, dat3 = brca$prot,
##D     x = brca$class, plats = c("microRNA", "RNA", "Protein"),
##D     diff.score = TRUE, B = 20, cores = 2)
## End(Not run)



