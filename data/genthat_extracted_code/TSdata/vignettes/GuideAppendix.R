### R code from vignette source 'GuideAppendix.Stex'

###################################################
### code chunk number 1: GuideAppendix.Stex:30-31
###################################################
options(continue="  ")


###################################################
### code chunk number 2: GuideAppendix.Stex:73-74
###################################################
user <- Sys.getenv("MYSQL_USER")


###################################################
### code chunk number 3: GuideAppendix.Stex:90-94
###################################################
setup <- RMySQL::dbConnect(RMySQL::MySQL(), dbname="test")  
TSsql::removeTSdbTables(setup, yesIknowWhatIamDoing=TRUE)
TSsql::createTSdbTables(setup, index=FALSE)
DBI::dbDisconnect(setup)


###################################################
### code chunk number 4: GuideAppendix.Stex:98-100
###################################################
library("TSMySQL")
con  <-  TSconnect("MySQL", dbname="test")


###################################################
### code chunk number 5: GuideAppendix.Stex:105-107 (eval = FALSE)
###################################################
## con <-  TSconnect("MySQL", dbname="test", 
##               username=user, password=passwd, host=host)


###################################################
### code chunk number 6: GuideAppendix.Stex:114-116
###################################################
detach("package:TSMySQL", unload=TRUE)
unloadNamespace("RMySQL")


###################################################
### code chunk number 7: GuideAppendix.Stex:137-138
###################################################
host    <- Sys.getenv("POSTGRES_HOST")


###################################################
### code chunk number 8: GuideAppendix.Stex:144-149
###################################################
setup <- RPostgreSQL::dbConnect(RPostgreSQL:::PostgreSQL(), dbname="test")  
TSsql::removeTSdbTables(setup, yesIknowWhatIamDoing=TRUE)
TSsql::createTSdbTables(setup, index=FALSE)
DBI::dbListTables(setup) 
DBI::dbDisconnect(setup)


###################################################
### code chunk number 9: GuideAppendix.Stex:153-155
###################################################
library("TSPostgreSQL")
con  <-  TSconnect("PostgreSQL", dbname="test", host=host)


###################################################
### code chunk number 10: GuideAppendix.Stex:160-162 (eval = FALSE)
###################################################
## con <-  TSconnect("PostgreSQL", dbname="test",
##                   user=user, password=passwd, host=host)


###################################################
### code chunk number 11: GuideAppendix.Stex:170-171
###################################################
detach("package:TSPostgreSQL")


###################################################
### code chunk number 12: GuideAppendix.Stex:183-188
###################################################
setup <- RSQLite::dbConnect(RSQLite::SQLite(), dbname="test")  
TSsql::removeTSdbTables(setup, yesIknowWhatIamDoing=TRUE)
TSsql::createTSdbTables(setup, index=FALSE)
DBI::dbListTables(setup) 
DBI::dbDisconnect(setup)


###################################################
### code chunk number 13: GuideAppendix.Stex:192-194
###################################################
library("TSSQLite")
con  <-  TSconnect("SQLite", dbname="test")


###################################################
### code chunk number 14: GuideAppendix.Stex:199-200
###################################################
detach("package:TSSQLite")


###################################################
### code chunk number 15: GuideAppendix.Stex:224-231
###################################################
library("TSodbc")
library("RODBC")
con <-  RODBC::odbcConnect(dsn="test") 
if(con == -1) stop("error establishing ODBC connection.") 
TSsql::removeTSdbTables(con, yesIknowWhatIamDoing=TRUE, ToLower=TRUE)
TSsql::createTSdbTables(con)
RODBC::odbcClose(channel=con)


###################################################
### code chunk number 16: GuideAppendix.Stex:235-237
###################################################
library("TSodbc")
con  <-  TSconnect("odbc", dbname="test")


###################################################
### code chunk number 17: GuideAppendix.Stex:242-243 (eval = FALSE)
###################################################
## con  <-  TSconnect("odbc", dbname="test", uid=user, pwd=passwd)


###################################################
### code chunk number 18: GuideAppendix.Stex:251-252
###################################################
detach("package:TSodbc")


###################################################
### code chunk number 19: GuideAppendix.Stex:334-339 (eval = FALSE)
###################################################
## setup <- ROracle::dbConnect(ROracle::Oracle(), dbname="test")  
## TSsql::removeTSdbTables(setup, yesIknowWhatIamDoing=TRUE)
## TSsql::createTSdbTables(setup, index=FALSE)
## DBI::dbListTables(setup) 
## DBI::dbDisconnect(setup)


###################################################
### code chunk number 20: GuideAppendix.Stex:344-346 (eval = FALSE)
###################################################
## library("TSOracle")
## con  <-  TSconnect("Oracle", dbname="test")


###################################################
### code chunk number 21: GuideAppendix.Stex:351-352 (eval = FALSE)
###################################################
## detach("package:TSOracle")


###################################################
### code chunk number 22: GuideAppendix.Stex:391-393 (eval = FALSE)
###################################################
## library("TSjson")
## con  <-  TSconnect("TSjson", dbname="proxy-cansim")


###################################################
### code chunk number 23: GuideAppendix.Stex:413-414 (eval = FALSE)
###################################################
## detach("package:TSjson")


###################################################
### code chunk number 24: GuideAppendix.Stex:433-434 (eval = FALSE)
###################################################
## con <- TSconnect("fame", dbname="testFame.db") 


###################################################
### code chunk number 25: GuideAppendix.Stex:438-439 (eval = FALSE)
###################################################
## con <- TSconnect("fame", dbname="ets /path/to/etsmfacansim.db", "read") 


###################################################
### code chunk number 26: GuideAppendix.Stex:447-448 (eval = FALSE)
###################################################
## detach("package:TSfame")


###################################################
### code chunk number 27: GuideAppendix.Stex:505-518
###################################################
library("RMySQL")
con <- dbConnect(MySQL(), dbname="test")
dbListTables(con)
dbGetQuery(con, "show tables;")
dbGetQuery(con, "describe A;")
dbGetQuery(con, "describe B;")
dbGetQuery(con, "describe D;")
dbGetQuery(con, "describe M;")
dbGetQuery(con, "describe Meta;")
dbGetQuery(con, "describe U;")
dbGetQuery(con, "describe Q;")
dbGetQuery(con, "describe S;")
dbGetQuery(con, "describe W;")


###################################################
### code chunk number 28: GuideAppendix.Stex:527-541
###################################################
dbGetQuery(con, paste(
     "SELECT COLUMN_NAME FROM INFORMATION_SCHEMA.Columns ",
     " WHERE TABLE_SCHEMA='test' AND table_name='A' ;")) 

dbGetQuery(con, paste(
     "SELECT COLUMN_NAME, COLUMN_DEFAULT, COLLATION_NAME, DATA_TYPE,",
     "CHARACTER_SET_NAME, CHARACTER_MAXIMUM_LENGTH, NUMERIC_PRECISION",
 "FROM INFORMATION_SCHEMA.Columns WHERE TABLE_SCHEMA='test' AND table_name='A' ;"))

dbGetQuery(con, paste(
   "SELECT COLUMN_NAME, DATA_TYPE, CHARACTER_MAXIMUM_LENGTH, NUMERIC_PRECISION",
 "FROM INFORMATION_SCHEMA.Columns WHERE TABLE_SCHEMA='test' AND table_name='M';"))

dbDisconnect(con)


###################################################
### code chunk number 29: GuideAppendix.Stex:561-566
###################################################
library("TSMySQL")
library("DBI")
con <- TSconnect("MySQL", dbname="test") 
dbGetQuery(con, "SELECT count(*) FROM Meta ;") 
dbGetQuery(con, "SELECT max(year) FROM A ;") 


###################################################
### code chunk number 30: GuideAppendix.Stex:570-571
###################################################
dbDisconnect(con)


