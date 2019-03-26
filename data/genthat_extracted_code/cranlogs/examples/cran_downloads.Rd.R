library(cranlogs)


### Name: cran_downloads
### Title: Daily package downloads from the RStudio CRAN mirror
### Aliases: cran_downloads

### ** Examples

## Not run: 
##D ## All downloads yesterday
##D cran_downloads()
##D 
##D ## All downloads for 'dplyr' yesterday
##D cran_downloads(packages = "dplyr")
##D 
##D ## Daily downloads for 'igraph' last week
##D cran_downloads(packages = "igraph", when = "last-week")
##D 
##D ## Downloads in the specified time interval
##D cran_downloads(from = "2014-06-30", to = "2014-08-08")
##D 
##D ## Multiple packages
##D cran_downloads(packages = c("ggplot2", "plyr", "dplyr"))
##D 
##D ## R downloads
##D cran_downloads("R")
## End(Not run)



