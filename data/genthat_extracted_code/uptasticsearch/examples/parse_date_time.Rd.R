library(uptasticsearch)


### Name: parse_date_time
### Title: Parse date-times from Elasticsearch records
### Aliases: parse_date_time

### ** Examples

# Sample es_search(), chomp_hits(), or chomp_aggs() output:
someDT <- data.table::data.table(id = 1:5
                                 , company = c("Apple", "Apple", "Banana", "Banana", "Cucumber")
                                 , timestamp = c("2015-03-14T09:26:53B", "2015-03-14T09:26:54B"
                                                 , "2031-06-28T08:53:07Z", "2031-06-28T08:53:08Z"
                                                 , "2000-01-01"))
          
# Note that the date field is character right now
str(someDT)

# Let's fix that!
someDT <- parse_date_time(input_df = someDT
                          , date_cols = "timestamp"
                          , assume_tz = "UTC")
str(someDT)



