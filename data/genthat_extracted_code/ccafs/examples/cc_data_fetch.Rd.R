library(ccafs)


### Name: cc_data_fetch
### Title: Download CCAFS data
### Aliases: cc_data_fetch

### ** Examples

## Not run: 
##D key <- "ccafs/ccafs-climate/data/ipcc_5ar_ciat_downscaled/rcp2_6/
##D  2030s/bcc_csm1_1_m/10min/
##D  bcc_csm1_1_m_rcp2_6_2030s_prec_10min_r1i1p1_no_tile_asc.zip"
##D 
##D (res <- cc_data_fetch(key = key))
##D # indexing maintains class for easier subsetting
##D res[1]
##D res[[1]]
##D res[1:2]
##D 
##D res <- cc_list_keys()
##D zips <- grep("\\.zip", res$Key, value = TRUE)
##D x <- cc_data_fetch(zips[1])
##D unclass(x)
##D cc_data_read(x[1])
##D cc_data_read(x[1:3])
##D cc_data_read(x)
##D 
##D library(raster)
##D plot(cc_data_read(x[1]))
##D plot(cc_data_read(x[1:3]))
##D 
##D # show progress
##D cc_cache_delete_all()
##D cc_data_fetch(key = key, progress = TRUE)
##D cc_cache_delete_all()
##D cc_data_fetch(key = key, progress = FALSE)
## End(Not run)



