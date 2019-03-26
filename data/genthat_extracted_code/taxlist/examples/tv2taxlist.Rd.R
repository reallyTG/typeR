library(taxlist)


### Name: tv2taxlist
### Title: Import species lists from Turboveg databases.
### Aliases: tv2taxlist

### ** Examples

library(taxlist)

## Cyperus data set installed as Turboveg species list
Cyperus <- tv2taxlist("cyperus", file.path(path.package("taxlist"), "tv_data"))

summary(Cyperus)



