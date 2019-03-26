library(scopr)


### Name: link_ethoscope_metadata_remote
### Title: Link ethoscope metadata to the matching result files
### Aliases: link_ethoscope_metadata_remote link_ethoscope_metadata

### ** Examples

# Metadata with no region_id -> all regions will be loaded with the same metadata
dir <- paste0(scopr_example_dir(), "/ethoscope_results/")
data(no_region_id_metadata)
metadata <- link_ethoscope_metadata(no_region_id_metadata, dir)
print(metadata)

# Metadata with region_id ->  only stated regions will be loaded with specific metadata
data(region_id_metadata)
metadata <- link_ethoscope_metadata(region_id_metadata, dir)
print(metadata)

## Not run: 
##D # If your files are stored on a remote server,
##D # this will download to a local directory only the needed files
##D REMOTE <- "ftp://a/remote/server/"
##D LOCAL_DIR <- "/where/I/store/the/data/"
##D metadata <- link_ethoscope_metadata_remote(region_id_metadata,
##D                                            REMOTE,
##D                                            LOCAL_DIR)
##D 
## End(Not run)



