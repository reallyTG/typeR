library(uptasticsearch)


### Name: es_search
### Title: Execute an ES query and get a data.table
### Aliases: es_search

### ** Examples

## Not run: 
##D 
##D ###=== Example 1: Get low-scoring food survey results ===###
##D 
##D query_body <- '{"query":{"filtered":{"filter":{"bool":{"must":[
##D                {"exists":{"field":"customer_comments"}},
##D                {"terms":{"overall_satisfaction":["very low","low"]}}]}}},
##D                "query":{"match_phrase":{"customer_comments":"food"}}}}'
##D 
##D # Execute the query, parse into a data.table
##D commentDT <- es_search(es_host = 'http://mydb.mycompany.com:9200'
##D                        , es_index = "survey_results"
##D                        , query_body = query_body
##D                        , scroll = "1m"
##D                        , n_cores = 4)
##D                  
##D ###=== Example 2: Time series agg features ===###
##D 
##D # Create query that will give you daily summary stats for revenue
##D query_body <- '{"query":{"filtered":{"filter":{"bool":{"must":[
##D                {"exists":{"field":"pmt_amount"}}]}}}},
##D                "aggs":{"timestamp":{"date_histogram":{"field":"timestamp","interval":"day"},
##D                "aggs":{"revenue":{"extended_stats":{"field":"pmt_amount"}}}}},"size":0}'
##D                
##D # Execute the query and get the result
##D resultDT <- es_search(es_host = "http://es.custdb.mycompany.com:9200"
##D                       , es_index = 'ticket_sales'
##D                       , query_body = query_body)
## End(Not run)



