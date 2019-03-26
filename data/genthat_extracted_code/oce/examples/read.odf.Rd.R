library(oce)


### Name: read.odf
### Title: Read an ODF file
### Aliases: read.odf

### ** Examples

library(oce)
# 1. Read a CTD cast made on the Scotian Shelf. Note that the file's metadata
# states that conductivity is in S/m, but it is really conductivity ratio,
# so we must alter the unit before converting to a CTD object. Note that
# read.odf() on this data file produces a warning suggesting that the user
# repair the unit, using the method outlined here.
odf <- read.odf(system.file("extdata", "CTD_BCD2014666_008_1_DN.ODF.gz", package="oce"))
ctd <- as.ctd(odf) ## so we can e.g. extract potential temperature
ctd[["conductivityUnit"]] <- list(unit=expression(), scale="")
#
# 2. Make a CTD, and plot (with span to show NS)
plot(ctd, span=500)
#
# 3. Highlight bad data on TS diagram. (Note that the eos
# is specified, because we will extract practical-salinity and
# UNESCO-defined potential temperatures for the added points.)
plotTS(ctd, type="o", eos="unesco") # use a line to show loops
bad <- ctd[["QCFlag"]]!=0
points(ctd[['salinity']][bad],ctd[['theta']][bad],col='red',pch=20)




