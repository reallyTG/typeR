library(canprot)


### Name: pdat_
### Title: Get Protein Data
### Aliases: pdat_ pdat_CRC pdat_pancreatic pdat_hypoxia pdat_osmotic

### ** Examples

data(canprot)
pdat_CRC()
pdat_CRC("JKMF10")  # same result as get_pdat("JKMF10")

## Not run: 
##D # how the extdata/summary/summary_*.csv files were made
##D for(what in c("CRC", "pancreatic", "hypoxia", "osmotic")) {
##D   pdat_fun <- paste0("pdat_", what)
##D   datasets <- get(pdat_fun)()
##D   comptab <- lapply_canprot(datasets, function(dataset) {
##D     pdat <- get_pdat(dataset, pdat_fun)
##D     get_comptab(pdat)
##D   }, varlist = "pdat_fun")
##D   # write summary table
##D   comptab <- do.call(rbind, comptab)
##D   comptab <- cbind(set = c(letters, LETTERS)[1:nrow(comptab)], comptab)
##D   comptab[, 6:15] <- signif(comptab[, 6:15], 4)
##D   filename <- paste0("summary_", what, ".csv")
##D   write.csv(comptab, filename, row.names = FALSE, quote = 3)
##D }
## End(Not run)



