library(berryFunctions)


### Name: convertUmlaut
### Title: Convert German Umlaute to ASCII
### Aliases: convertUmlaut
### Keywords: character

### ** Examples

## Not run: 
##D link <- paste0("ftp://ftp-cdc.dwd.de/pub/CDC/observations_germany/climate/",
##D                "monthly/kl/recent/KL_Monatswerte_Beschreibung_Stationen.txt")
##D weatherstations <- read.fwf(link, widths=c(6,9,10,16,11,8,41,99), skip=3)
##D examples <- removeSpace(weatherstations[c(153, 509, 587, 2, 651, 851),7])
##D examples
##D convertUmlaut(examples) # note how lower and upper case is kept
## End(Not run)




