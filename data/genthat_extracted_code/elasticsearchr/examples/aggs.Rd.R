library(elasticsearchr)


### Name: aggs
### Title: Define Elasticsearch aggregation.
### Aliases: aggs

### ** Examples

avg_sepal_width_per_cat <- aggs('{"avg_sepal_width_per_cat": {
      "terms": {"field": "species"},
      "aggs": {"avg_sepal_width": {"avg": {"field": "sepal_width"}}}}
}')



