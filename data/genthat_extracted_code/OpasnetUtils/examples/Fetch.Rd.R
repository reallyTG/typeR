library(OpasnetUtils)


### Name: Fetch
### Title: Fetch R objects described in a data.frame
### Aliases: Fetch Fetch2

### ** Examples

deps <- data.frame(Name = "exposure", Key = "6WYTFxiZUIxiY8tw")
## Not run: 
##D Fetch(deps)
##D exposure
## End(Not run)

# If variable exists
exposure <- 1
Fetch(deps)
exposure # by default existing variables are not changed



