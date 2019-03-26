library(openair)


### Name: importMeta
### Title: Import monitoring site meta data for the AURN, KCL and SAQN
###   networks
### Aliases: importMeta
### Keywords: methods

### ** Examples

## import AQ data and add meta data to data frame
## Not run: 
##D aq <- importAURN(site = c("kc1", "my1"), year = 2009)
##D meta <- importMeta(source = "aurn")
##D aq <- merge(aq, meta, by = "site")
## End(Not run)

## aggregate first before adding meta data (useful for many sites/years)
## Not run: 
##D aq <- importAURN(site = c("kc1", "my1"), year = 2009)
##D meta <- importMeta(source = "aurn")
##D ## calculate annual means
##D annual <- timeAverage(aq, avg.time = "year", type = "site")
##D annual <- merge(annual, meta, by = "site")
## End(Not run)



