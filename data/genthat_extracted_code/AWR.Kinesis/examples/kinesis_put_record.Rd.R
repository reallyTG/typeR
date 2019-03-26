library(AWR.Kinesis)


### Name: kinesis_put_record
### Title: Write a record to a Kinesis Stream
### Aliases: kinesis_put_record

### ** Examples

## Not run: 
##D df <- mtcars[1, ]
##D str(kinesis_put_record('test-AWR', data = jsonlite::toJSON(df), partitionKey = row.names(df)))
## End(Not run)



