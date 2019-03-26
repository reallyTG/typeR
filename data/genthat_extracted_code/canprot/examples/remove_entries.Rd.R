library(canprot)


### Name: remove_entries
### Title: Remove Data Entries
### Aliases: remove_entries

### ** Examples

datadir <- paste0(system.file("extdata", package="canprot"), "/expression/CRC/")
dataset <- "STK+15"
# an excerpt from pdat_CRC() for dataset="STK+15"
dat <- read.csv(paste0(datadir, "STK+15.csv"), as.is=TRUE)
dat <- remove_entries(dat, is.na(dat$uniprot), dataset, "missing")
# the above prints "STK+15: dropping 3 missing proteins"



