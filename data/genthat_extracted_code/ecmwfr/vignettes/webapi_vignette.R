## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

opts <- options(keyring_warn_for_env_fallback = FALSE)

# load the library
library(ncdf4)
library(raster)
library(maps)
library(ecmwfr)

# import the encrypted key if desired
# (does not exist locally)
key <- system("echo $KEY", intern = TRUE)
if(key != "" & key != "$KEY"){
  wf_set_key(user = "khrdev@outlook.com",
             key = system("echo $KEY", intern = TRUE))
}
rm(key)

# check cran, same routine as skip_on_cran()
# but not dependent on testthat which might
# not be available on user systems (not required
# only suggested)
check_cran <- function() {
  key <- try(wf_get_key("khrdev@outlook.com"))
  if (!inherits(key, "try-error")){
    return(TRUE)
  } else {
    return(FALSE)
  }
}

# do cran check
cran <- check_cran()

## ----eval = FALSE--------------------------------------------------------
#  # set a key to the keychain
#  wf_set_key(user = "khrdev@outlook.com",
#             key = "XXXXXXXXXXXXXXXXXXXXXX")
#  
#  # you can retrieve the key using
#  wf_get_key(user = "khrdev@outlook.com")
#  
#  # the output should be the key you provided
#  # in this case represented by the fake X string.
#  # "XXXXXXXXXXXXXXXXXXXXXX"

## ----eval = FALSE, message=FALSE, warning=FALSE--------------------------
#  # this is an example of a request
#  my_request <- list(stream  = "oper",
#                     levtype = "sfc",
#                     param   = "167.128",
#                     dataset = "interim",
#                     step    = "0",
#                     grid    = "0.75/0.75",
#                     time    = "00",
#                     date    = "2014-07-01/to/2014-07-02",
#                     type    = "an",
#                     class   = "ei",
#                     area    = "73.5/-27/33/45",
#                     format  = "netcdf",
#                     target  = "tmp.nc")
#  
#  # an example download using fw_request()
#  # using the above request list()
#  ncfile <- wf_request(user    = "khrdev@outlook.com",
#             request  = my_request,
#             transfer = TRUE,
#             path     = tempdir(),
#             verbose  = FALSE)

## ----echo = FALSE--------------------------------------------------------
ncfile <- system.file(package = "ecmwfr","extdata/webapi.nc")

## ----fig.width = 7, fig.height = 7, eval = cran--------------------------
s <- raster::stack(ncfile)
print(s)

raster::plot(s[[1]], main = "2 meter temperature (Kelvin)")
maps::map("world", add = TRUE)

## ----mars example, eval = FALSE------------------------------------------
#  # this is an example of a request
#  my_request <- list("dataset" = "mars",
#                     "class"   = "od",
#                     "date"    = "2019-01-22",
#                     "expver"  = "1",
#                     "levtype" = "sfc",
#                     "param"   = "167.128",
#                     "step"    = "0",
#                     "stream"  = "oper",
#                     "time"    = "12",
#                     "type"    = "fc",
#                     "grid"    = "0.125/0.125",
#                     "area"    = "50/0/30/15",
#                     "format"  = "netcdf",
#                     "target"  = "mars-data.nc")
#  
#  # Submit mars request and wait for netcdf file
#  wf_request(user    = "khrdev@outlook.com",
#             transfer = TRUE,
#             path     = "~",
#             request  = my_request,
#             verbose  = FALSE)

## ----eval = cran---------------------------------------------------------
# user info
user_info <- wf_user_info(user = "khrdev@outlook.com")
head(user_info)

# services
services <- wf_services(user = "khrdev@outlook.com")
head(services)

# datasets
datasets <- wf_datasets(user = "khrdev@outlook.com")
head(datasets)

