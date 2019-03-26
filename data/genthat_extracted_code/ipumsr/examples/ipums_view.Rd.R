library(ipumsr)


### Name: ipums_view
### Title: View a static webpage with variable information from a IPUMS
###   extract
### Aliases: ipums_view

### ** Examples

ddi <- read_ipums_ddi(ipums_example("cps_00006.xml"))
## Not run: 
##D ipums_view(ddi)
##D ipums_view(ddi, "codebook.html", launch = FALSE)
## End(Not run)



