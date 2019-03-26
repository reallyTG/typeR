library(brandwatchR)


### Name: bwr_mentions_get
### Title: Get a list of mentions for the specified query and project
### Aliases: bwr_mentions_get

### ** Examples

## Not run: 
##D my_project <- bwr_projects_get()$id[1]
##D my_query <- bwr_query_get(project_id = my_project)$id[1]
##D my_mentions <- bwr_mentions_get(project_id = my_project,
##D                                 query_id = my_query,
##D                                 filters = list(gender = 'female', sentiment = 'neutral'),
##D                                 order_by = 'sentiment', order_direction = 'asc',
##D                                 date_range = c('2018-01-01', '2018-02-01'))
## End(Not run)




