library(birdring)


### Name: codes2names
### Title: Transforms codes of circumstances, condition, species and sheme
###   into string
### Aliases: codes2names
### Keywords: transformation codes

### ** Examples

# circumstances
examplecode <- c(20, 21, 35, 80)
codes2names(examplecode) 

# conditions
examplecodes <- c(0:9)
codes2names(examplecodes, variable="conditions")

# schemes
codes2names("BGS", variable="schemes")



