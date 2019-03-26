library(elasticsearchr)


### Name: +.elastic_api
### Title: Define Elasticsearch aggregation on a secific subset of
###   documents.
### Aliases: +.elastic_api

### ** Examples

all_docs <- query('{"match_all": {}}')
avg_sepal_width_per_cat <- aggs('{"avg_sepal_width_per_cat": {
      "terms": {"field": "species"},
      "aggs": {"avg_sepal_width": {"avg": {"field": "sepal_width"}}}}
}')
all_docs + avg_sepal_width_per_cat

sort_by_sepal_width <- sort_on('[{"sepal_width": {"order": "asc"}}]')
all_docs + sort_by_sepal_width



