library(phylotaR)


### Name: setup
### Title: Set-up parameters
### Aliases: setup

### ** Examples

## Not run: 
##D   
##D   # Note: this example requires BLAST to run.
##D   
##D   # example with temp folder
##D   wd <- file.path(tempdir(), 'aotus')
##D   # setup for aotus, make sure aotus/ folder already exists
##D   if (!dir.exists(wd)) {
##D     dir.create(wd)
##D   }
##D   ncbi_dr <- '[SET BLAST+ BIN PATH HERE]'
##D   # e.g. "/usr/local/ncbi/blast/bin/"
##D   setup(wd = wd, txid = 9504, ncbi_dr = ncbi_dr)  # txid for Aotus primate genus
##D   # see ?parameters for all available parameter options
## End(Not run)



