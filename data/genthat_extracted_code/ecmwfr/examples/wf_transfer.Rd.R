library(ecmwfr)


### Name: wf_transfer
### Title: ECMWF data transfer function
### Aliases: wf_transfer
### Keywords: climate, data download, re-analysis

### ** Examples


## Not run: 
##D # set key
##D wf_set_key(user = "test@mail.com", key = "123")
##D 
##D # request data and grab url and try a transfer
##D r <- wf_request("test@email.com", transfer = FALSE)
##D 
##D # check transfer, will download if available
##D wf_transfer("test@email.com", url = r$href)
## End(Not run)



