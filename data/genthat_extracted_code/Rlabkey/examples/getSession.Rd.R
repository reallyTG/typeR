library(Rlabkey)


### Name: getSession
### Title: Creates and returns a LabKey Server session
### Aliases: getSession
### Keywords: file

### ** Examples

## No test: 

# library(Rlabkey)

s <- getSession("http://www.labkey.org", "/home")
s   #shows schemas

## using the curlOptions for generating debug tracesof network traffic
d<- debugGatherer()
copt <- curlOptions(debugfunction=d$update, verbose=TRUE,
    cookiefile='/cooks.txt')
sdbg<- getSession(baseUrl="http://localhost:8080/labkey",
    folderPath="/apisamples", curlOptions=copt)
getRows(sdbg, scobj$AllTypes)
strwrap(d$value(), 100)

## End(No test)



