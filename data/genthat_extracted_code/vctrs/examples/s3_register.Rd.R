library(vctrs)


### Name: s3_register
### Title: Register a method for a suggested dependency
### Aliases: s3_register
### Keywords: internal

### ** Examples

# A typical use case is to dynamically register tibble/pillar methods
# for your class. That way you avoid creating a hard depedency on packages
# that are not essential, while still providing finer control over
# printing when they are used.

.onLoad <- function(...) {
  s3_register("pillar::pillar_shaft", "vctrs_vctr")
  s3_register("tibble::type_sum", "vctrs_vctr")
}



