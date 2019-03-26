library(cobalt)


### Name: set.cobalt.options
### Title: Set options in cobalt
### Aliases: set.cobalt.options get.cobalt.options

### ** Examples

# Set un to be TRUE to always display unadjusted 
# balance measures and set binary to "std" to 
# produce standardized mean differences for 
# binary variables.

set.cobalt.options(un = TRUE, binary = "std")

# Note: the above is equivalent to:
# options(cobalt_un = TRUE, cobalt_binary = "std")
# but performs some additional checks

get.cobalt.options("un", "binary")

# Note: the above is equivalent to:
# getOption("cobalt_un")
# getOption("cobalt_binary")

# Return all cobalt options to their defaults

set.cobalt.options(default = TRUE)

# View all available options
get.cobalt.options()



