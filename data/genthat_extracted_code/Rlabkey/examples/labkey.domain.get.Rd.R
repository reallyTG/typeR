library(Rlabkey)


### Name: labkey.domain.get
### Title: Returns the metadata for an existing LabKey domain
### Aliases: labkey.domain.get
### Keywords: IO

### ** Examples

## No test: 

## retrieve an existing domain
library(Rlabkey)

labkey.domain.get(baseUrl="http://labkey/", folderPath="home",
    schemaName="lists", queryName="test list")
## End(No test)



