library(phylotaR)


### Name: reset
### Title: Reset a phylotaR pipeline run
### Aliases: reset

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
##D   # individually run taxise
##D   taxise_run(wd = wd)
##D   # reset back to taxise as if it has not been run
##D   reset(wd = 'aotus', stage = 'taxise')
##D   # run taxise again ....
##D   taxise_run(wd = wd)
## End(Not run)



