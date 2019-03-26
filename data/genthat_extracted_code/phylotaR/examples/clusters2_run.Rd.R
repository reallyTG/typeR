library(phylotaR)


### Name: clusters2_run
### Title: Run the cluster2 stage
### Aliases: clusters2_run

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
##D   # individually run stages
##D   taxise_run(wd = wd)
##D   download_run(wd = wd)
##D   clusters_run(wd = wd)
##D   clusters2_run(wd = wd)
## End(Not run)



