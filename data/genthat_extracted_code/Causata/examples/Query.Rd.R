library(Causata)


### Name: Query
### Title: Build queries to extract data from Causata.
### Aliases: Query is.Query Ops.Query Ops.FocalPointQuery WithVariables
###   Variables Variables<- Variables.Query Variables<-.Query Limit Limit<-
###   Limit.Query Limit<-.Query as.character.Query WithEvents
### Keywords: SQL

### ** Examples

q <- Query()
q <- q + WithVariables(c("var1", "var2"))
q <- q + Where("variable-one", GreaterThan(30))
Variables(q) # returns c("var1", "var2")
Variables(q) <- c("var2", "var3") # set the variables for this query
Limit(q) # since the limit has not been set this returns NULL
Limit(q) <- 1000 # Sets the limit to 1000
as.character(q)

q <- Query() + WithVariables("variable-one", "variable-two") + 
  Where("variable-one", GreaterThan(5))
# The example below is commented out since it requires a server connection.
# With a connection this would retrieve data and return it in a dataframe df.
## Not run: 
##D conn <- Connect(hostname, port, username, password)
##D data <- GetData(conn, q)
## End(Not run)



