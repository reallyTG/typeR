library(PKPDmisc)


### Name: rename_table_pattern
### Title: simple table name replacement for a given pattern
### Aliases: rename_table_pattern

### ** Examples

## Not run: 
##D # rename all spaces to underscore
##D df <- rename_table_pattern(read_table("data/data.csv"))
##D # rename "-" to "_"
##D df <- rename_table_pattern(read_table("data/data.csv"), "-", "_")
##D #rename an existing df
##D df <-rename_table_pattern(df, "-", "_")
## End(Not run)



