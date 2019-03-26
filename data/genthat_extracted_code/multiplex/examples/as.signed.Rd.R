library(multiplex)


### Name: as.signed
### Title: Coerce to a Signed Object
### Aliases: as.signed
### Keywords: array models

### ** Examples

## Load the data
data("incubA")

## Coerce parts of the signed matrix with two types of relations
as.signed(signed(incubA$IM)$s[1:2,1:2])




