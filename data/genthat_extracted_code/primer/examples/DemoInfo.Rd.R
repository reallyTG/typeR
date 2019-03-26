library(primer)


### Name: DemoInfo
### Title: Demographic Analyses
### Aliases: DemoInfo
### Keywords: methods

### ** Examples

### A two stage annual transition matrix
annual <- matrix( c( 0, 100, .025, 0), byrow=TRUE, nrow=2)
### Generate useful summaries
DemoInfo(annual)



