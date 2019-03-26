library(tdthap)


### Name: hap.transmit
### Title: Build parental haplotypes in nuclear families
### Aliases: hap.transmit
### Keywords: htest

### ** Examples

## Not run: 
##D # Read a pedfile (which includes the variable names in the top line) 
##D # and build haplotypes using the markers which appear third, second, and 
##D # first in the pedfile. 
##D 
##D   filespec <- system.file("tests/test.ped", package="tdthap")
##D   ped <- read.table(filespec)
##D 
##D   haps <- hap.transmit(ped, markers=c(3,2,1))
##D 
## End(Not run)


