library(Causata)


### Name: Vinclude
### Title: Create lists of variables from Causata for queries.
### Aliases: Vinclude Vinclude.Connect Vexclude Vexclude.Connect Vtime
###   Vtime.Connect BacktickCollapse

### ** Examples

# Some of these examples require a Causata connection, so they are not run
## Not run: 
##D conn <- Connect(group="example")
##D 
##D # View available variables
##D View(conn$variables)
##D 
##D # View available time ranges
##D View(conn$timeRanges)
##D 
##D # View available time points
##D View(conn$timePoints)
##D 
##D # Get a list of variables matching the given labels: all online and demographics
##D variables <- Vinclude(conn, label.patterns=c("online", "demographics"))
##D 
##D # Get a list of all variables except those with "test" in the name
##D variables <- Vexclude(conn, name.patterns="test")
##D 
##D # build a query string and extract data
##D query.str <- paste(
##D   "select", BacktickCollapse(variables),
##D   "from customers")
##D df <- GetData(conn, query.str)
##D Close(conn)
## End(Not run)

# simple example with BacktickCollapse
BacktickCollapse(c("variable-one", "variable-two"))



