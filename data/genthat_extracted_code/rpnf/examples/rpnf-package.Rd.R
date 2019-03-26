library(rpnf)


### Name: rpnf-package
### Title: rpnf - The R Point & Figure Package
### Aliases: rpnf-package
### Keywords: package

### ** Examples

# Load rpnf library
library(rpnf) 
# Load free available sample data 
data(DOW) 
# Determine point and figure informations for a linear chart with boxsize of 1 point
pnfdata <- pnfprocessor(
  high=DOW$High,
  low=DOW$Low,
  date=DOW$Date,
  boxsize=1L,
  log=FALSE)  
# Show the object obtained
str(pnfdata)
# Show the data obtained
pnfdata
# Create a TXT based plot with X and O's
pnfplottxt(pnfdata,boxsize=1L,log=FALSE)
# Create a more graphical plot 
pnfplot(pnfdata)
## Not run: 
##D ### Second example: logarithmc example
##D # For most stocks and indices it is useful
##D # to do the analysis on a logarithmic scale.
##D # This can be done with pnfprocessor, too. 
##D # Ensure to make use of the getLogBoxsize() function 
##D # for an appropriate boxsize of a logarithmic chart.
##D # Determine point and figure informations for a logarithmic chart with boxsize 2% 
##D symbol.pnf <- pnfprocessor(
##D   high=DOW$High,
##D   low=DOW$Low,
##D   date=DOW$Date,
##D   boxsize=getLogBoxsize(2),
##D   log=TRUE)  
##D 
##D # View the result
##D tail(symbol.pnf)
##D #View(symbol.pnf)
##D 
##D # or plot it as a modern chart
##D pnfplot(symbol.pnf,main="P&F Plot DOW (log)")
##D # Or in the old traditional TXT style
##D pnfplottxt(symbol.pnf,boxsize=getLogBoxsize(2),log=TRUE,main="P&F Plot DOW (log)")
##D 
##D ### Additional examples
##D # Examples for additional uses cases like
##D # - relative strength vs index
##D # - bullish percent of an index
##D # - and many others 
##D # can be found in your local package library directory.
##D # Search for rpnf-example1.R, rpnf-example2.R and so on.
## End(Not run)



