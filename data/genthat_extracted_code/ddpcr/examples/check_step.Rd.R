library(ddpcr)


### Name: check_step
### Title: Ensure the plate's status is at the right step
### Aliases: check_step
### Keywords: internal

### ** Examples

## Not run: 
##D dir <- sample_data_dir()
##D plate <- new_plate(dir)
##D status(plate) # current step
##D check_step(plate, 2) # are we ready to start step 2?
##D check_step(plate, 3) # are we ready to start step 3?
##D plate <- next_step(plate)
##D status(plate)
##D check_step(plate, 3) # now are we ready to start step 3?  
## End(Not run)



