library(wql)


### Name: wqData
### Title: Construct an object of class "WqData"
### Aliases: wqData
### Keywords: classes data

### ** Examples

## Not run: 
##D  
##D 
##D # Create new WqData object from sfbay data. First combine date and time
##D # into a single string after making sure that all times have 4 digits.
##D sfb <- within(sfbay, time <- substring(10000 + time, 2, 5))
##D sfb <- within(sfb, time <- paste(date, time, sep = ' '))
##D sfb <- wqData(sfb, 2:4, 5:12, site.order = TRUE, type = "wide",
##D     time.format = "%m/%d/%Y %H%M")
##D 
##D head(sfb)
##D tail(sfb)
##D 
##D # If time of day were not required, then the following would suffice:
##D sfb <- wqData(sfbay, c(1,3,4), 5:12, site.order = TRUE, type = "wide", 
##D   time.format = "%m/%d/%Y")
## End(Not run)




