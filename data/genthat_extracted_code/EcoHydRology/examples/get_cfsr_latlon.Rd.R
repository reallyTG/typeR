library(EcoHydRology)


### Name: get_cfsr_latlon
### Title: This is a funciton to grab daily summaries of the CFSR from the
###   drfuka.org service
### Aliases: get_cfsr_latlon

### ** Examples

## Not run: 
##D 
##D hist_wx=get_cfsr_latlon(45,-72,"dan@dan.com",timeoff=0,interppow=2)
##D plot(hist_wx$TMX)
##D 
## End(Not run)
## The function is currently defined as
function (declat, declon, emailaddr, timeoff = 0, interppow = 2) 
{
    library(XML)
    options(timeout = 120)
    url = paste("http://www.cfsr.tamu-cornell.drfuka.org/swat-cfsr-v02.pl?lat=", 
        declat, "&lon=", declon, "&timeoff=", timeoff, "&interppow=", 
        interppow, "&.submit=Submit", sep = "")
    hist_wx = readHTMLTable(url, which = 1, header = T, colClasses = c("character", 
        "numeric", "numeric", "numeric", "numeric", "numeric", 
        "numeric", "numeric", "numeric"))
    hist_wx$DATE = as.Date(hist_wx$DATE, format = "%Y-%m-%d")
    return(hist_wx)
  }



