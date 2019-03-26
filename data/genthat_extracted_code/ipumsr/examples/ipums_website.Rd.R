library(ipumsr)


### Name: ipums_website
### Title: Launch a browser window to the ipums website
### Aliases: ipums_website

### ** Examples

ddi <- read_ipums_ddi(ipums_example("cps_00006.xml"))
ipums_website(ddi, "MONTH", launch = FALSE)

## Not run: 
##D # Launches website
##D ipums_website(ddi, "MONTH")
## End(Not run)

# Can also specify project instead of using DDI
ipums_website(var = "RECTYPE", project = "IPUMS-CPS", launch = FALSE)





