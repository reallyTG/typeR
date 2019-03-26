library(resample)


### Name: resample-data
### Title: Data sets for resampling examples
### Aliases: resample-data TV Verizon
### Keywords: datasets

### ** Examples

## Not run: 
##D data(TV); summary(TV)
##D Basic <- with(TV, Time[Cable == "Basic"])
##D Extended <- with(TV, Time[Cable == "Extended"])
##D 
##D data(Verizon); summary(Verizon)
##D ILEC <- with(Verizon, Time[Group == "ILEC"])
##D CLEC <- with(Verizon, Time[Group == "CLEC"])
## End(Not run)



