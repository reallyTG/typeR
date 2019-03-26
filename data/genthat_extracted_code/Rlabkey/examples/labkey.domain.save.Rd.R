library(Rlabkey)


### Name: labkey.domain.save
### Title: Updates an existing LabKey domain
### Aliases: labkey.domain.save
### Keywords: IO

### ** Examples

## No test: 

library(Rlabkey)
## change the type of one of the columns
domain <- labkey.domain.get(baseUrl="http://labkey/", folderPath="home",
    schemaName="lists", queryName="test list")

domain$fields[3,]$rangeURI = "xsd:string"
domain$fields[3,]$name = "changed to string"

labkey.domain.save(baseUrl="http://labkey/", folderPath="home",
    schemaName="lists", queryName="test list", domainDesign=domain)
## End(No test)



