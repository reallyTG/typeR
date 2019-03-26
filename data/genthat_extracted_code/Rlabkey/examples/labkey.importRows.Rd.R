library(Rlabkey)


### Name: labkey.importRows
### Title: Import rows of data into a LabKey Server
### Aliases: labkey.importRows
### Keywords: IO

### ** Examples

## No test: 

## Note that users must have the necessary permissions in the database
## to be able to modify data through the use of these functions
# library(Rlabkey)

newrows <- data.frame(
	DisplayFld="Imported from R"
	, RequiredText="abc"
	, RequiredInt=1
	, stringsAsFactors=FALSE)
newrows = newrows[rep(1:nrow(newrows),each=5),]

importedInfo <- labkey.importRows("http://localhost:8080/labkey",
    folderPath="/apisamples", schemaName="lists", queryName="AllTypes",
    toImport=newrows)

importedInfo$rowsAffected

## End(No test)



