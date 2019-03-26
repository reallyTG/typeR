library(Rlabkey)


### Name: labkey.selectRows
### Title: Retrieve data from a labkey database
### Aliases: labkey.selectRows
### Keywords: IO

### ** Examples

## No test: 

## select from a list named AllTypes
# library(Rlabkey)

rows <- labkey.selectRows(
	baseUrl="http://localhost:8080/labkey",
	folderPath="/apisamples",
	schemaName="lists", 
	queryName="AllTypes")
	
## select from a view on that list
viewrows <- labkey.selectRows(baseUrl="http://localhost:8080/labkey",
    folderPath="/apisamples", schemaName="Lists", queryName="AllTypes",
    viewName="rowbyrow")

## select a subset of columns
colSelect=c("TextFld", "IntFld")
subsetcols <- labkey.selectRows(baseUrl="http://localhost:8080/labkey",
    folderPath="/apisamples", schemaName="lists", queryName="AllTypes",
    colSelect=colSelect)

## End(No test)



