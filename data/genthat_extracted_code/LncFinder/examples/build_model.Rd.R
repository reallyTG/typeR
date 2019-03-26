library(LncFinder)


### Name: build_model
### Title: Build Users' Own Model
### Aliases: build_model

### ** Examples

## Not run: 
##D data(demo_DNA.seq)
##D Seqs <- demo_DNA.seq
##D 
##D ### Build the model with pre-build frequencies.file:
##D my_model <- build_model(lncRNA.seq = Seqs[1:5], mRNA.seq = Seqs[6:10],
##D                         frequencies.file = "human", SS.features = FALSE,
##D                         lncRNA.format = "DNA", mRNA.format = "DNA",
##D                         parallel.cores = 2, folds.num = 2, seed = 1,
##D                         gamma.range = (2 ^ seq(-5, -1, 2)),
##D                         cost.range = c(2, 6, 12, 20))
##D 
##D ### Users can use default values of gamma.range and cost.range to find the
##D best parameters.
##D ### Use your own frequencies file by assigning frequencies list to parameter
##D ### "frequencies.file".
## End(Not run)



