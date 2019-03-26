library(Rlabkey)


### Name: labkey.domain.create
### Title: Create a new LabKey domain
### Aliases: labkey.domain.create
### Keywords: IO

### ** Examples

## No test: 

## create a data frame and infer it's fields, then create a domain design from it
library(Rlabkey)

df <- data.frame(ptid=c(1:3), age = c(10,20,30), sex = c("f", "m", "f"))
fields <- labkey.domain.inferFields(baseUrl="http://labkey/", folderPath="home", df=df)
dd <- labkey.domain.createDesign(name="test list", fields=fields)

## create a new list with an integer key field
labkey.domain.create(baseUrl="http://labkey/", folderPath="home",
    domainKind="IntList", domainDesign=dd, options=list(keyName = "ptid"))

## create a domain using a domain template
labkey.domain.create(baseUrl="http://labkey/", folderPath="home",
    domainTemplate="Priority", module="simpletest", domainGroup="todolist")
## End(No test)



