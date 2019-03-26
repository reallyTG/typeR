library(NCmisc)


### Name: memory.summary
### Title: Summary of RAM footprint for all R objects in the current
###   session. Not my function, but taken from an R-Help response by
###   Elizabeth Purdom, at Berkeley. Simply applies the function
###   'object.size' to the objects in ls(). Also very similar to an example
###   in the 'Help' for the utils::object.size() function.
### Aliases: memory.summary

### ** Examples

memory.summary() # shows memory used by all objects in the current session in kb
memory.summary("mb") # change units to megabytes



