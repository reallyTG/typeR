library(epanetReader)


### Name: Net1
### Title: Epanet's Net1 Example
### Aliases: Net1

### ** Examples

#confirm built-in dataset matches output of read.inp
inp <- file.path( find.package("epanetReader"), "extdata","Net1.inp") 
n1 <- suppressWarnings( read.inp(inp) )
ok <- isTRUE( all.equal(Net1, n1))
if( ok==FALSE) stop("built-in Net1 doesn't match read.inp")



