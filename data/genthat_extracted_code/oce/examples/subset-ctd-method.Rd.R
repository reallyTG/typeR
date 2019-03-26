library(oce)


### Name: subset,ctd-method
### Title: Subset a CTD Object
### Aliases: subset,ctd-method

### ** Examples

library(oce)
data(ctd)
plot(ctd)
## Example 1
plot(subset(ctd, pressure<10))
## Example 2
plot(subset(ctd, indices=1:10))




