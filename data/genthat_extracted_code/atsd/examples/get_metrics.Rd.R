library(atsd)


### Name: get_metrics
### Title: Get information about metrics from Axibase Time-Series Database.
### Aliases: get_metrics

### ** Examples

## Not run: 
##D # get all metrics and include all their tags in the data frame
##D get_metrics()
##D 
##D # get the top 100 active metrics which have tag, 'table', 
##D # include this tag into response and exclude oter user-defined metric tags
##D get_metrics(expression = "tags.table != ''", active = "true", 
##D             tags = "table", limit = 100)
##D 
##D # get metrics which have user-defined metric tag, 'table', 
##D # and whose name starts with 'cpu'
##D get_metrics(expression = "name like 'cpu*' and tags.table != ''")
##D             
##D # more complitcated expressions
##D get_metrics(expression = "likeAll(name, list('*disk*,*use*'))")
##D get_metrics(expression = "(name like 'cpu*' or tags.source = '') and tags.table like 'BC*'")
## End(Not run)



