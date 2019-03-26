library(openair)


### Name: importAURN
### Title: Import data from the UK Automatic Urban and Rural Network (AURN)
### Aliases: importAURN
### Keywords: methods

### ** Examples



## import all pollutants from Marylebone Rd from 1990:2009
## Not run: mary <- importAURN(site = "my1", year = 2000:2009)

## import nox, no2, o3 from Marylebone Road and Nottingham Centre for 2000
## Not run: 
##D thedata <- importAURN(site = c("my1", "nott"), year = 2000,
##D pollutant = c("nox", "no2", "o3"))
## End(Not run)

## import over 20 years of Mace Head O3 data!
## Not run: o3 <- importAURN(site = "mh", year = 1987:2009)

## import hydrocarbon (and other) data from Marylebone Road
## Not run: mary <- importAURN(site = "my1", year =1998, hc = TRUE)

## reshape the data so that each column represents a pollutant/site
## Not run: 
##D require(reshape2)
##D thedata <- importAURN(site = c("nott", "kc1"), year = 2008,
##D pollutant = "o3")
##D thedata <- melt(thedata, measure.vars = "o3")
##D thedata <- dcast(thedata, ... ~ variable + site + code)
##D ## thedata now has columns  o3_Nottingham Centre_NOTT o3_London N. Kensington_KC1
##D 
## End(Not run)





