library(vegtable)


### Name: as.list
### Title: Coerce an S4 object to a list.
### Aliases: as.list as.list,coverconvert-method as.list,vegtable-method
### Keywords: methods

### ** Examples

## Importing 'Easplist' from taxlist
library(taxlist)
data(Easplist)

## Head of slot 'taxonNames'
class(Easplist)
head(Easplist@taxonNames)

## The same after coercing to list
Easplist <- as.list(Easplist)
class(Easplist)
head(Easplist$taxonNames)



