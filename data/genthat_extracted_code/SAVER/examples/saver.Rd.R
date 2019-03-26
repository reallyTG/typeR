library(SAVER)


### Name: saver
### Title: Runs SAVER
### Aliases: saver

### ** Examples

data("linnarsson")

## Not run: 
##D system.time(linnarsson_saver <- saver(linnarsson, ncores = 12))
## End(Not run)

# predictions for top 5 highly expressed genes
## Not run: 
##D saver2 <- saver(linnarsson, npred = 5)
## End(Not run)

# predictions for certain genes
## Not run: 
##D genes <- c("Thy1", "Mbp", "Stim2", "Psmc6", "Rps19")
##D genes.ind <- which(rownames(linnarsson) %in% genes)
##D saver3 <- saver(linnarsson, pred.genes = genes.ind)
## End(Not run)

# return only certain genes
## Not run: 
##D saver4 <- saver(linnarsson, pred.genes = genes.ind, pred.genes.only = TRUE)
## End(Not run)




