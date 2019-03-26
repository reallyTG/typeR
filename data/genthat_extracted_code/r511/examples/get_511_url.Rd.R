library(r511)


### Name: get_511_url
### Title: Use the trread import_gtfs function to import an MTC 511 GTFS
###   zip file into a list of R dataframes
### Aliases: get_511_url

### ** Examples

## Not run: 
##D #set your api key as an environmental variable
##D Sys.setenv(APIKEY511="yourkeyhere")
##D #if you don't have a key, you can get one here:
##D #https://511.org/developers/list/tokens/create
##D operator_df <- xml511_to_tibble()
##D bart_code <- df1[df1$name=='Bay Area Rapid Transit',]$privatecode
##D bart_gtfs_data <- get_mtc_511_gtfs(bart_code)
## End(Not run)



