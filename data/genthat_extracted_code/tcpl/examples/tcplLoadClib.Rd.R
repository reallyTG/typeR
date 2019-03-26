library(tcpl)


### Name: tcplLoadClib
### Title: Load chemical library information
### Aliases: tcplLoadClib

### ** Examples

## Store the current config settings, so they can be reloaded at the end 
## of the examples
conf_store <- tcplConfList()
tcplConfExample()

## Passing no parameters gives all of the chemical ISs that have a chemical
## library registered
clib <- tcplLoadClib()

## Notice there are more rows in tcplLoadClib than in tcplLoadChem, 
## indicating some chemicals must belong to more than library.
chem <- tcplLoadChem(include.spid = FALSE)
nrow(chem)
nrow(clib)

## It is possible that some chemicals do not have a chemical library 
## registered, although this is not the case in the example data.
all(chem$chid %in% clib$chid)

## Show the unique chemical libraries
clib[ , unique(clib)]

## Specifying a chemical library will not show what other libraries a 
## chemical might belong to.
tcplLoadClib(field = "clib", val = "TOXCAST")
tcplLoadClib(field = "chid", val = 20182)

## Reset configuration
options(conf_store)




