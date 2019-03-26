library(ecmwfr)


### Name: wf_request
### Title: ECMWF data request and download
### Aliases: wf_request
### Keywords: climate, data download, re-analysis

### ** Examples


## Not run: 
##D # set key
##D wf_set_key(user = "test@mail.com", key = "123")
##D 
##D request <-  = list(stream = "oper",
##D    levtype = "sfc",
##D    param = "167.128",
##D    dataset = "interim",
##D    step = "0",
##D    grid = "0.75/0.75",
##D    time = "00",
##D    date = "2014-07-01/to/2014-07-02",
##D    type = "an",
##D    class = "ei",
##D    area = "50/10/51/11",
##D    format = "netcdf",
##D    target = "tmp.nc")
##D 
##D # get the default test data
##D wf_request(user = "test@mail.com", request = request)
## End(Not run)



