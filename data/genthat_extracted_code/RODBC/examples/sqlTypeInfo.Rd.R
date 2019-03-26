library(RODBC)


### Name: sqlTypeInfo
### Title: Request Information about Data Types in an ODBC Database
### Aliases: sqlTypeInfo
### Keywords: IO database

### ** Examples
## Not run: 
##D > names(sqlTypeInfo(channel))
##D  [1] "TYPE_NAME"          "DATA_TYPE"          "COLUMN_SIZE"       
##D  [4] "LITERAL_PREFIX"     "LITERAL_SUFFIX"     "CREATE_PARAMS"     
##D  [7] "NULLABLE"           "CASE_SENSITIVE"     "SEARCHABLE"        
##D [10] "UNSIGNED_ATTRIBUTE" "FIXED_PREC_SCALE"   "AUTO_UNIQUE_VALUE" 
##D [13] "LOCAL_TYPE_NAME"    "MINIMUM_SCALE"      "MAXIMUM_SCALE"     
##D [16] "SQL_DATATYPE"       "SQL_DATETIME_SUB"   "NUM_PREC_RADIX"    
##D [19] "INTERVAL_PRECISION"
## End(Not run)


