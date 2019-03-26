library(AWR.Athena)


### Name: Athena
### Title: Athena DBI wrapper
### Aliases: Athena dbConnect,AthenaDriver-method

### ** Examples

## Not run: 
##D require(DBI)
##D con <- dbConnect(AWR.Athena::Athena(), region='us-west-2', 
##D                  S3OutputLocation='s3://nfultz-athena-staging', 
##D                  Schema='default')
##D dbListTables(con)
##D dbGetQuery(con, "Select count(*) from sampledb.elb_logs")
## End(Not run)



