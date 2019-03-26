library(brandwatchR)


### Name: bwr_mentions_topics
### Title: Get a dataframe of topic data for a specified Brandwatch query
###   or query group
### Aliases: bwr_mentions_topics

### ** Examples

## Not run: 
##D my_project <- bwr_projects_get()$id[1]
##D my_query <- bwr_query_get(project_id = my_project)$id[1]
##D my_mentions <- bwr_mentions_topics(project_id = my_project,
##D                                    query_id = my_query,
##D                                    date_range = c('2018-01-01', '2018-02-01'))
## End(Not run)



