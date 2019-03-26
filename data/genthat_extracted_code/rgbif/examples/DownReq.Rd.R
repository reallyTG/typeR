library(rgbif)


### Name: DownReq
### Title: Download request
### Aliases: DownReq
### Keywords: internal

### ** Examples

## Not run: 
##D # res <- DownReq$new(occ_download('taxonKey = 3119195', "year = 1991"))
##D # res
##D # res$req
##D # res$run()
##D # (requests <- GbifQueue$new())
##D # res$run(keep_track = TRUE)
##D # requests
##D # res$status()
##D 
##D # prepared query
##D res <- DownReq$new(occ_download_prep("basisOfRecord = LITERATURE", 
##D   user = "foo", pwd = "bar", email = "foo@bar.com"))
##D res
##D # res$run()
##D # res
##D # res$status()
##D # res$result
## End(Not run)



