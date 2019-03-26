library(ebdbNet)


### Name: dataFormat
### Title: Change the Format of Longitudinal Data to be Compatible with
###   EBDBN
### Aliases: dataFormat
### Keywords: methods

### ** Examples

library(ebdbNet)
library(GeneNet) ## Load GeneNet package to use T-cell activation data

data(tcell)  ## Load T-cell activation data
tc44 <- combine.longitudinal(tcell.10, tcell.34)

## Put data into correct format for algorithm
tcell.dat <- dataFormat(tc44)



