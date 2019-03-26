library(Rlabkey)


### Name: labkey.domain.createDesign
### Title: Helper function to create a domain design data structure
### Aliases: labkey.domain.createDesign
### Keywords: IO

### ** Examples

## No test: 

## create a data frame and infer it's fields, then create a domain design from it
library(Rlabkey)

df <- data.frame(ptid=c(1:3), age = c(10,20,30), sex = c("f", "m", "f"))
fields <- labkey.domain.inferFields(baseUrl="http://labkey/", folderPath="home", df=df)
dd <- labkey.domain.createDesign(name="test list", fields=fields)

## End(No test)



