library(oai)


### Name: dumpers
### Title: Result dumpers
### Aliases: dump_raw_to_db dump_raw_to_txt dump_to_rds dumpers

### ** Examples

## Not run: 
##D 
##D ### Dumping raw XML to text files
##D 
##D # This will write a set of XML files to a temporary directory
##D fnames <- list_identifiers(from="2015-09-01",
##D                            until="2015-09-01",
##D                            as="raw",
##D                            dumper=dump_raw_to_txt,
##D                            dumper_args=list(file_dir=tempdir()))
##D # vector of file names created
##D str(fnames)
##D all( file.exists(fnames) )
##D # clean-up
##D unlink(fnames)
##D 
##D 
##D ### Dumping raw XML to a database
##D 
##D # Connect to in-memory SQLite database
##D con <- DBI::dbConnect(RSQLite::SQLite(), dbname=":memory:")
##D # Harvest and dump the results into field "bar" of table "foo"
##D list_identifiers(from="2015-09-01",
##D                  until="2015-09-01",
##D                  as="raw",
##D                  dumper=dump_raw_to_db,
##D                  dumper_args=list(dbcon=con,
##D                                   table_name="foo",
##D                                   field_name="bar") )
##D # Count records, should be 101
##D DBI::dbGetQuery(con, "SELECT count(*) as no_records FROM foo")
##D 
##D DBI::dbDisconnect(con)
##D 
##D 
##D 
##D 
## End(Not run)



