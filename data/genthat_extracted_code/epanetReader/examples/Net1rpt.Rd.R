library(epanetReader)


### Name: Net1rpt
### Title: Epanet's Net1 Example
### Aliases: Net1rpt

### ** Examples

#confirm built-in dataset matches output of read.rpt
rpt <- file.path( find.package("epanetReader"), "extdata","Net1.rpt") 
n1r <- read.rpt(rpt)
ok <- isTRUE( all.equal(Net1rpt, n1r))
if( ok==FALSE) stop("built-in Net1rpt doesn't match read.rpt")



