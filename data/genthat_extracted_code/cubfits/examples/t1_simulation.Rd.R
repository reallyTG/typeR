library(cubfits)


### Name: Simulation Tool
### Title: Simulate ORFs and Expression Data
### Aliases: simu.orf simu.phi.Obs simu.mixnormerr
### Keywords: tool

### ** Examples

## Not run: 
##D suppressMessages(library(cubfits, quietly = TRUE))
##D set.seed(1234)
##D 
##D # Generate sequences.
##D da.roc <- simu.orf(length(ex.train$phi.Obs), b.Init$roc,
##D                    phi.Obs = ex.train$phi.Obs, model = "roc")
##D names(da.roc) <- names(ex.train$phi.Obs)
##D write.fasta(da.roc, names(da.roc), "toy_roc.fasta")
## End(Not run)



