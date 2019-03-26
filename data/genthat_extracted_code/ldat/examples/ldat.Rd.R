library(ldat)


### Name: ldat
### Title: Create an ldat object
### Aliases: ldat is_ldat

### ** Examples

# Create ldat object from r-objects
a <- ldat(id = 1:20, x = letters[1:20], y = rnorm(20))
# this is identical to
a <- ldat(id = as_lvec(1:20), x = as_lvec(letters[1:20]), 
    y = as_lvec(rnorm(20)))




