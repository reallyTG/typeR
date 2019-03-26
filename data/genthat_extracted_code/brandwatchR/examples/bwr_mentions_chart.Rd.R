library(brandwatchR)


### Name: bwr_mentions_chart
### Title: Get a dataframe of chart-ready data for a specified Brandwatch
###   query or query group
### Aliases: bwr_mentions_chart

### ** Examples

## Not run: 
##D my_project <- bwr_projects_get()$id[1]
##D my_query <- bwr_query_get(project_id = my_project)$id[1]
##D my_mentions_chart <- bwr_mentions_chart(project_id = my_project,
##D                                         query_id = my_query,
##D                                         date_range = c('2018-01-01', '2018-02-01'),
##D                                         aggregate = "month",
##D                                         dimension1 = "sentiment",
##D                                         dimension2 = "volume")
## End(Not run)



