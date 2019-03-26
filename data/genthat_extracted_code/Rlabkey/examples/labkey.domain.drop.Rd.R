library(Rlabkey)


### Name: labkey.domain.drop
### Title: Delete a LabKey domain
### Aliases: labkey.domain.drop
### Keywords: IO

### ** Examples

## No test: 

## delete an existing domain
library(Rlabkey)

labkey.domain.drop(baseUrl="http://labkey/", folderPath="home",
    schemaName="lists", queryName="test list")
## End(No test)



