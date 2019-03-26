library(getTBinR)


### Name: search_data_dict
### Title: Search the WHO TB Data Dictionary by Variable Name.
### Aliases: search_data_dict

### ** Examples


## Search for a known variable
## Download and save the dictionary if it is not available locally
search_data_dict(var = "country")

## Search for all variables mentioning mortality in their definition
search_data_dict(def = "mortality")

## Search for both a known variable and for mortality being mentioned in there definition
## Duplicate entries will be omitted.
search_data_dict(var = "e_mort_exc_tbhiv_100k", def = "mortality")




