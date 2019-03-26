library(REDCapR)


### Name: redcap_project
### Title: A 'Reference Class' to make later calls to REDCap more
###   convenient.
### Aliases: redcap_project

### ** Examples

library(REDCapR) #Load the package into the current R session.
uri <- "https://bbmc.ouhsc.edu/redcap/api/"
token <- "D70F9ACD1EDD6F151C6EA78683944E98"
## Not run: 
##D project <- redcap_project$new(redcap_uri=uri, token=token)
##D ds_all <- project$read()
##D 
##D #Demonstrate how repeated calls are more concise when the token and url aren't always passed.
##D ds_three_columns <- project$read(fields=c("record_id", "sex", "height"))$data
##D 
##D ids_of_males vv <- ds_three_columns$record_id[ds_three_columns$sex==1]
##D ids_of_shorties <- ds_three_columns$record_id[ds_three_columns$height < 40]
##D 
##D ds_males        <- project$read(records=ids_of_males, batch_size=2)$data
##D ds_shorties     <- project$read(records=ids_of_shorties)$data
##D 
##D #Switch the Genders
##D sex_original         <- ds_three_columns$sex
##D ds_three_columns$sex <- (1 - ds_three_columns$sex)
##D project$write(ds_three_columns)
##D 
##D #Switch the Genders back
##D ds_three_columns$sex <- sex_original
##D project$write(ds_three_columns)
## End(Not run)



