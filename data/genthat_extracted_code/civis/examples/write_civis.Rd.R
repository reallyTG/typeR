library(civis)


### Name: write_civis
### Title: Upload a local data frame or csv file to the Civis Platform
###   (Redshift)
### Aliases: write_civis write_civis.data.frame write_civis.character
###   write_civis.numeric

### ** Examples

## Not run: 
##D df <- read.csv(local_file)
##D 
##D # Create new table, fail if already exists
##D write_civis(df, "schema.my_table", "my_database")
##D 
##D # Create new table, append if already exists
##D write_civis(df, "schema.my_table", "my_database", if_exists="append")
##D 
##D # Create new table with defined diskey / sortkeys for speed
##D write_civis(df, "schema.my_table", "my_database", distkey="id",
##D             sortkey1="added_date")
##D 
##D # Create new table directly from a saved csv
##D write_civis("my/file/path.csv", "schema.my_table", "my_database")
##D 
##D # Create new table from a file_id
##D id <- write_civis_file("my/file/path.csv", name = "path.csv")
##D write_civis(id, "schema.my_table", "my_database")
##D 
## End(Not run)



