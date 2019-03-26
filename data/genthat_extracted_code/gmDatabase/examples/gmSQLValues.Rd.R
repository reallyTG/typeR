library(gmDatabase)


### Name: gmSQLValues
### Title: Format vector in parenthesis and SQL quote it
### Aliases: gmSQLValues
### Keywords: database

### ** Examples

## Not run: 
##D .gmDB <- dbConnect(...)
##D complexString <- "He said: \"I\'m going to the circus\"\n"
##D cat(complexString)
##D gmEscapeStrings(complexString)
##D cat(gmEscapeStrings(complexString),"\n")
##D cat(gmSQLValues(complexString),"\n")
##D myfactor <- factor(c("a","a","b"))
##D cat(gmSQLValues(myfactor),"\n")
##D num <- 1:3
##D cat(gmSQLValues(num),"\n")
##D 
##D X <- data.frame(string=rep(complexString,3),fac=myfactor,x=num)
##D cat(gmSQLValues(X),"\n")
## End(Not run)




