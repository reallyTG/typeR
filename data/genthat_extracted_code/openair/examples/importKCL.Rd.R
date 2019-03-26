library(openair)


### Name: importKCL
### Title: Import data from King's College London networks
### Aliases: importKCL
### Keywords: methods

### ** Examples



## import all pollutants from Marylebone Rd from 1990:2009
## Not run: mary <- importKCL(site = "my1", year = 2000:2009)

## import nox, no2, o3 from Marylebone Road and North Kensignton for 2000
## Not run: 
##D thedata <- importKCL(site = c("my1", "kc1"), year = 2000,
##D pollutant = c("nox", "no2", "o3"))
## End(Not run)

## import met data too...
## Not run: my1 <- importKCL(site = "my1", year = 2008, met = TRUE)

## reshape the data so that each column represents a pollutant/site
## Not run: 
##D require(reshape2)
##D thedata <- importKCL(site = c("my1", "kc1"), year = 2008,
##D pollutant = "o3")
##D thedata <- melt(thedata, measure.vars="o3")
##D thedata <- dcast(thedata, ... ~ site + code + variable)
##D ## thedata now has columns for O3 at MY1 and KC1
##D 
## End(Not run)







