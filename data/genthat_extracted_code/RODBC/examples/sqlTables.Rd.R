library(RODBC)


### Name: sqlTables
### Title: List Tables on an ODBC Connection
### Aliases: sqlTables
### Keywords: IO database

### ** Examples

## Not run: 
##D > sqlTables(channel, "USArrests")
##D ## MySQL example
##D   TABLE_CAT TABLE_SCHEM TABLE_NAME TABLE_TYPE REMARKS
##D 1    ripley              USArrests      TABLE        
##D ## PostgreSQL example
##D   TABLE_QUALIFIER TABLE_OWNER TABLE_NAME TABLE_TYPE REMARKS
##D 1          ripley      public  usarrests      TABLE        
##D ## Microsoft Access example
##D > sqlTables(channel)
##D       TABLE_CAT TABLE_SCHEM        TABLE_NAME   TABLE_TYPE REMARKS
##D 1 C:\bdr\test        <NA> MSysAccessObjects SYSTEM TABLE    <NA>
##D 2 C:\bdr\test        <NA>          MSysACEs SYSTEM TABLE    <NA>
##D 3 C:\bdr\test        <NA>       MSysObjects SYSTEM TABLE    <NA>
##D 4 C:\bdr\test        <NA>       MSysQueries SYSTEM TABLE    <NA>
##D 5 C:\bdr\test        <NA> MSysRelationships SYSTEM TABLE    <NA>
##D 6 C:\bdr\test        <NA>             hills        TABLE    <NA>
##D 7 C:\bdr\test        <NA>         USArrests        TABLE    <NA>
## End(Not run)


