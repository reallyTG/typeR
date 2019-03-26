library(tcpl)


### Name: tcplLoadChem
### Title: Load sample/chemical information
### Aliases: tcplLoadChem

### ** Examples

## Store the current config settings, so they can be reloaded at the end 
## of the examples
conf_store <- tcplConfList()
tcplConfExample()

## Passing no parameters gives all of the registered chemicals with their
## sample IDs
tcplLoadChem()

## Or the user can exclude spid and get a unique list of chemicals
tcplLoadChem(include.spid = FALSE)

## In addition, the user can retrieve only the registered chemicals from the chemical table
tcplLoadChem(field = 'chem.only')

## Other examples:
tcplLoadChem(field = "chnm", val = "Bisphenol A")
tcplLoadChem(field = "chid", val = 20182)

## Reset configuration
options(conf_store)




