library(manymodelr)


### Name: get_data_Stats
### Title: A pipe friendly way to get summary stats for exploratory data
###   analysis
### Aliases: get_data_Stats

### ** Examples

library(dplyr)
mtcars %>%
get_data_Stats(mean)
mtcars %>%
get_data_Stats(get_mode)
## Not run: 
##D get_data_Stats(airquality,min)
##D airquality%>%
##D get_data_Stats(get_mode)
## End(Not run)



