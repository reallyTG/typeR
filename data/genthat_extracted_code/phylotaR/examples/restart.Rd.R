library(phylotaR)


### Name: restart
### Title: Restart a phylotaR pipeline run
### Aliases: restart

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
##D   # run and stop after 10 seconds
##D   R.utils::withTimeout(expr = {
##D     run(wd = wd)
##D   }, timeout = 10)
##D   # use ctrl+c or Esc to kill without a timelimit
##D   # and restart with ....
##D   restart(wd = wd)
## End(Not run)



