library(Rlabkey)


### Name: lsSchemas
### Title: List the available schemas
### Aliases: lsSchemas
### Keywords: file

### ** Examples

## No test: 

##  get a list of schemas available in the current session context
# library(Rlabkey)

lks<- getSession(baseUrl="http://localhost:8080/labkey",
    folderPath="/apisamples")

#returns several schema names, e.g. "lists", "core", "MS1", etc.
lsSchemas(lks)

## End(No test)



