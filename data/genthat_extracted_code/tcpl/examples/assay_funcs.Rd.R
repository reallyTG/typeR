library(tcpl)


### Name: Load assay information
### Title: Functions for loading assay information
### Aliases: 'Load assay information' tcplLoadAcid tcplLoadAeid tcplLoadAid
###   tcplLoadAsid

### ** Examples

## Store the current config settings, so they can be reloaded at the end 
## of the examples
conf_store <- tcplConfList()
TCPLlite <- file.path(system.file(package = "tcpl"), "example")
tcplConf(db = TCPLlite, user = NA, host = NA, drvr = "tcplLite")

## The load assay functions can be used without any parameters to list the 
## full list of registered assay elements:
tcplLoadAsid()
tcplLoadAeid()

## Similarly, the user can add fields without doing any element selection:
tcplLoadAeid(add.fld = c("asid", "aid", "acid"))

## Or, the user can look only at a subset:
tcplLoadAeid(fld = "aeid", val = 1, add.fld = "asid")

## The field can be any value in one of the corresponding assay element
## tables, but the functions also recognize the abbreviated version of
## the name fields.
tcplListFlds("assay")
a1 <- tcplLoadAeid(fld = "anm", val = "Steroidogenesis")
a2 <- tcplLoadAeid(fld = "assay_name", val = "Steroidogenesis")
identical(a1, a2)

## Reset configuration
options(conf_store)




