library(phylotaR)


### Name: parameters_reset
### Title: Change parameters in a working directory
### Aliases: parameters_reset

### ** Examples

## Not run: 
##D   
##D   # Note: this example requires BLAST and internet to run.
##D   
##D   # example with temp folder
##D   wd <- file.path(tempdir(), 'aotus')
##D   # setup for aotus, make sure aotus/ folder already exists
##D   if (!dir.exists(wd)) {
##D     dir.create(wd)
##D   }
##D   ncbi_dr <- '[SET BLAST+ BIN PATH HERE]'
##D   setup(wd = wd, txid = 9504, ncbi_dr = ncbi_dr)  # txid for Aotus primate genus
##D   # run
##D   # run(wd = wd) # not running in test
##D   # use ctrl+c or Esc to kill
##D   # change parameters, e.g. min and max sequence lengths
##D   parameters_reset(wd = 'aotus', parameters = c('mnsql', 'mxsql'),
##D                    values = c(300, 1500))
##D   # see ?parameters
##D   # restart
##D   restart(wd = wd)
## End(Not run)



