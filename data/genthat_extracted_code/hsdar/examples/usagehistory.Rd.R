library(hsdar)


### Name: usagehistory
### Title: History of usage
### Aliases: usagehistory usagehistory<-
### Keywords: utilities

### ** Examples

data(spectral_data)

## Return history of usage
usagehistory(spectral_data)

## Deleting history of usage
usagehistory(spectral_data) <- NULL
spectral_data

## Adding entries
usagehistory(spectral_data) <- "New entry"   ## Adding new entry
usagehistory(spectral_data) <- "New entry 2" ## Adding second entry
spectral_data




