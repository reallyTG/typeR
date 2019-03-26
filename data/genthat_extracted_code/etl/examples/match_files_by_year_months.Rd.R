library(etl)


### Name: match_files_by_year_months
### Title: Match year and month vectors to filenames
### Aliases: match_files_by_year_months extract_date_from_filename

### ** Examples

## Not run: 
##D if (require(airlines)) {
##D   airlines <- etl("airlines", dir = "~/dumps/airlines") %>%
##D     etl_extract(year = 1987)
##D   summary(airlines)
##D   match_files_by_year_months(list.files(attr(airlines, "raw_dir")),
##D     pattern = "On_Time_On_Time_Performance_%Y_%m.zip"), year = 1987)
##D }
## End(Not run)



