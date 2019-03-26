library(rgr)


### Name: gx.ngr.stats
### Title: Computes Summary Statistics for a NGR Report Table
### Aliases: gx.ngr.stats
### Keywords: univar

### ** Examples

## Make test data available
data(sind)
attach(sind)

## Generate and display the results for Zn 
table <- gx.ngr.stats(Zn)
table

## Detach test data
detach(sind)



