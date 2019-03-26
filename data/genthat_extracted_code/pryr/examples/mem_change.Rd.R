library(pryr)


### Name: mem_change
### Title: Determine change in memory from running code
### Aliases: mem_change

### ** Examples

# Need about 4 mb to store 1 million integers
mem_change(x <- 1:1e6)
# We get that memory back when we delete it
mem_change(rm(x))



