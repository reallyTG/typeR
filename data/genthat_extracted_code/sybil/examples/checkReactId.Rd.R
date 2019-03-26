library(sybil)


### Name: checkReactId
### Title: Check if a Reaction Id is Valid
### Aliases: checkReactId
### Keywords: character

### ** Examples

  data(Ec_core)
 
  ## Example with react as character vector
  ids <- c("ATPM", "ACK")
  idc <- checkReactId(Ec_core, ids)

  ## Example with react as numerical vector
  ids <- c(1:4)
  idc <- checkReactId(Ec_core, ids)



