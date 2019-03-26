library(AWR.Kinesis)


### Name: kinesis_consumer
### Title: Run Kinesis Consumer application
### Aliases: kinesis_consumer

### ** Examples

## Not run: 
##D flog.threshold(FATAL)
##D AWS.Kinesis::kinesis_consumer(
##D   initialize = function() flog.info('Loading some data'),
##D   processRecords = function(records) flog.info('Received some records from Kinesis'),
##D   updater = list(list(1, function() flog.info('Updating some data every minute')),
##D                  list(1/60, function() flog.info('This is a high frequency updater call')))
##D )
## End(Not run)



