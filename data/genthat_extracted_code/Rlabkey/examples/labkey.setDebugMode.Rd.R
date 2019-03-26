library(Rlabkey)


### Name: labkey.setDebugMode
### Title: Helper function to enable/disable debug mode.
### Aliases: labkey.setDebugMode
### Keywords: IO

### ** Examples

## No test: 

library(Rlabkey)
labkey.setDebugMode(TRUE)
labkey.executeSql(
    baseUrl="http://localhost:8080/labkey",
    folderPath="/home",
    schemaName="core",
    sql = "select * from containers")

## End(No test)



