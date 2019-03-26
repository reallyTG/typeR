library(RODBC)


### Name: odbcDataSources
### Title: List ODBC Data Sources
### Aliases: odbcDataSources
### Keywords: utilities

### ** Examples
## Not run: 
##D > odbcDataSources()
##D         test      sqlite3       testpg 
##D      "MySQL"    "sqlite3" "PostgreSQL"
##D or
##D                           testdb3                           sqlite3
##D          "MySQL ODBC 3.51 Driver"             "SQLite3 ODBC Driver"
##D                           bdr.xls                           testacc
##D  "Microsoft Excel Driver (*.xls)" "Microsoft Access Driver (*.mdb)"
##D                            testpg                         SQLServer
##D                 "PostgreSQL ANSI"               "SQL Native Client"
##D                            Oracle                               DB2
##D        "Oracle in OraDb10g_home1"  "IBM DB2 ODBC DRIVER - DB2COPY1"
##D                           testpgw                           testdb5
##D              "PostgreSQL Unicode"           "MySQL ODBC 5.1 Driver"
##D                 SQLite Datasource           SQLite UTF-8 Datasource
##D              "SQLite ODBC Driver"      "SQLite ODBC (UTF-8) Driver"
##D                SQLite3 Datasource                             mimdb
##D             "SQLite3 ODBC Driver"                           "MIMER"
## End(Not run)


