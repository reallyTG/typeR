library(tcpl)


### Name: tcplCytoPt
### Title: Calculate the cytotoxicity point based on the "burst" endpoints
### Aliases: tcplCytoPt

### ** Examples

## Store the current config settings, so they can be reloaded at the end 
## of the examples
conf_store <- tcplConfList()
tcplConfDefault()

## Can only calculate the cytotox burst if using the MySQL database and
## TCPL_DRVR == 'RMySQL'

if (conf_store == 'RMySQL') {

## Load the "burst" endpoints -- none are defined in the example dataset
tcplLoadAeid(fld = "burst_assay", val = 1)

## Calculate the cytotoxicity distributions using both example endpoints
tcplCytoPt(aeid = 1:2)

## The above example does not calculate a global MAD, because no chemical
## hit both endpoints. (This makes sense, because both endpoints are 
## derived from one component, where one endpoint is acitivity in the
## up direction, and the other is activity in the down direction.)
## Note, the cyto_pt is also 3 for all chemicals, because the function
## requires at least two endpoints to calculate a cytotoxicity point. If 
## the user wishes to use one assay, this function is not necessary. 

## Changing 'default.pt' will change cyto_pt in the resulting data.table
tcplCytoPt(aeid = 1:2, default.pt = 6)
}

## Reset configuration
options(conf_store)




