library(uptasticsearch)


### Name: chomp_aggs
### Title: Aggs query to data.table
### Aliases: chomp_aggs

### ** Examples

# A sample raw result from an aggs query combining date_histogram and extended_stats:
result <- '{"aggregations":{"dateTime":{"buckets":[{"key_as_string":"2016-12-01T00:00:00.000Z",
"key":1480550400000,"doc_count":123,"num_potatoes":{"count":120,"min":0,"max":40,"avg":15,
"sum":1800,"sum_of_squares":28000,"variance":225,"std_deviation":15,"std_deviation_bounds":{
"upper":26,"lower":13}}},{"key_as_string":"2017-01-01T00:00:00.000Z","key":1483228800000,
"doc_count":134,"num_potatoes":{"count":131,"min":0,"max":39,"avg":16,"sum":2096,
"sum_of_squares":34000,"variance":225,"std_deviation":15,"std_deviation_bounds":{"upper":26,
"lower":13}}}]}}}'

# Parse into a data.table
aggDT <- chomp_aggs(aggs_json = result)
print(aggDT)



