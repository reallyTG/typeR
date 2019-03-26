library(quantmod)


### Name: getFinancials
### Title: Download and View Financial Statements
### Aliases: getFinancials viewFinancials getFin viewFin
### Keywords: utilities

### ** Examples

## Not run: 
##D getFinancials('JAVA')  # returns JAVA.f to "env"
##D getFin('AAPL') # returns AAPL.f to "env"
##D 
##D viewFin(JAVA.f, "IS", "Q")  # Quarterly Income Statement
##D viewFin(AAPL.f, "CF", "A")   # Annual Cash Flows
##D 
##D str(AAPL.f)
## End(Not run)



