library(Rlabkey)


### Name: labkey.domain.inferFields
### Title: Infer field metadata from a data frame
### Aliases: labkey.domain.inferFields
### Keywords: IO

### ** Examples

## No test: 

## create a data frame and infer it's fields
library(Rlabkey)

df <- data.frame(ptid=c(1:3), age = c(10,20,30), sex = c("f", "m", "f"))
fields <- labkey.domain.inferFields(baseUrl="http://labkey/", folderPath="home", df=df)

## End(No test)



