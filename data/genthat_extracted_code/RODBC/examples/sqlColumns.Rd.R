library(RODBC)


### Name: sqlColumns
### Title: Query Column Structure in ODBC Tables
### Aliases: sqlPrimaryKeys sqlColumns
### Keywords: IO database

### ** Examples

## Not run: 
##D ## example results from MySQL
##D > channel <- odbcConnect("test")
##D > sqlDrop(channel, "USArrests", errors = FALSE) # precautionary
##D > sqlSave(channel, USArrests, addPK = TRUE)
##D > sqlColumns(channel, "USArrests")
##D   TABLE_CAT TABLE_SCHEM TABLE_NAME COLUMN_NAME DATA_TYPE TYPE_NAME
##D 1    ripley        <NA>  USArrests    rownames        12   varchar
##D 2    ripley        <NA>  USArrests      Murder         8    double
##D 3    ripley        <NA>  USArrests     Assault         4   integer
##D 4    ripley        <NA>  USArrests    UrbanPop         4   integer
##D 5    ripley        <NA>  USArrests        Rape         8    double
##D ... 12 more columns
##D 
##D > sqlColumns(channel, "USArrests", special = TRUE)
##D   SCOPE COLUMN_NAME DATA_TYPE TYPE_NAME COLUMN_SIZE BUFFER_LENGTH
##D 1     2    rownames        12   varchar         255           255
##D   DECIMAL_DIGITS PSEUDO_COLUMN
##D 1             NA             1
##D 
##D > sqlPrimaryKeys(channel, "USArrests")
##D   TABLE_CAT TABLE_SCHEM TABLE_NAME COLUMN_NAME KEY_SEQ PK_NAME
##D 1      <NA>        <NA>  USArrests    rownames       1 PRIMARY
##D > sqlDrop(channel, "USArrests")
##D > close(channel)
## End(Not run)


