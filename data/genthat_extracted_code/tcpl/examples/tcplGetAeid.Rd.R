library(tcpl)


### Name: tcplGetAeid
### Title: get Aeid for endpoint name
### Aliases: tcplGetAeid

### ** Examples

## Store the current config settings, so they can be reloaded at the end 
## of the examples 
conf_store <- tcplConfList()
tcplConfExample()

## Search for aenm (assay name) case insensitive
tcplGetAeid("TOX21")
tcplGetAeid("tox21")

## Reset configuration
options(conf_store)




