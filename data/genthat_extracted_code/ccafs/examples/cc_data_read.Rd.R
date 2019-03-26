library(ccafs)


### Name: cc_data_read
### Title: Read CCAFS data
### Aliases: cc_data_read

### ** Examples

## Not run: 
##D key <- "ccafs/ccafs-climate/data/ipcc_5ar_ciat_downscaled/rcp2_6/
##D  2030s/bcc_csm1_1_m/10min/
##D  bcc_csm1_1_m_rcp2_6_2030s_prec_10min_r1i1p1_no_tile_asc.zip"
##D res <- cc_data_fetch(key = key)
##D 
##D # a single file
##D cc_data_read(res[1])
##D 
##D # select individual files
##D cc_data_read(res[1:2])
##D 
##D # all files
##D cc_data_read(res)
##D 
##D # character path input
##D ## you can also pass in a path to a file(s)
##D cc_data_read(unclass(res[1]))
##D 
##D # plot data
##D library(raster)
##D plot(cc_data_read(res[1:3]))
## End(Not run)



