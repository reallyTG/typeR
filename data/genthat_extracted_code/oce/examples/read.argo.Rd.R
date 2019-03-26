library(oce)


### Name: read.argo
### Title: Read an Argo Data File
### Aliases: read.argo

### ** Examples

## Not run: 
##D ## Example 1: read from a local file
##D library(oce)
##D d <- read.argo("/data/OAR/6900388_prof.nc")
##D summary(d)
##D plot(d)
##D 
##D ## Example 2: construct URL for download (brittle)
##D id <- "6900388"
##D url <- "http://www.usgodae.org/ftp/outgoing/argo"
##D if (!length(list.files(pattern="argo_index.txt")))
##D     download.file(paste(url, "ar_index_global_meta.txt", sep="/"), "argo_index.txt")
##D index <- readLines("argo_index.txt")
##D line <- grep(id, index)
##D if (0 == length(line)) stop("id ", id, " not found")
##D if (1 < length(line)) stop("id ", id, " found multiple times")
##D dac <- strsplit(index[line], "/")[[1]][1]
##D profile <- paste(id, "_prof.nc", sep="")
##D float <- paste(url, "dac", dac, id, profile, sep="/")
##D download.file(float, profile)
##D argo <- read.argo(profile)
##D summary(argo)
## End(Not run)





