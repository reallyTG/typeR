library(Nippon)


### Name: kakasi
### Title: Interface to kakasi
### Aliases: kakasi
### Keywords: Japanese language character

### ** Examples

## Not run: 
##D library(Nippon)
##D data(prefectures)
##D regions <- unique(prefectures$region)
##D regions
##D # Unix-like operating systems
##D kakasi(regions)
##D # Windows
##D regions.cp932 <- iconv(regions, from = "UTF-8", to = "CP932")
##D kakasi(regions.cp932)
## End(Not run)



