library(RJDemetra)


### Name: get_ts
### Title: Get the input raw time series
### Aliases: get_ts

### ** Examples

## No test: 
sa_x13 <- x13_def(ipi_c_eu[, "FR"], spec = "RSA5c")

wk <- new_workspace()
mp <- new_multiprocessing(wk, "sa1")
add_sa_item(wk, "sa1", sa_x13, "X13")
sa_item <- get_object(mp, 1)

  # Extracting from a SA:
get_ts(sa_x13) # Returns the ts object ipi_c_eu[, "FR"]

  # Extracting from a sa_item:
get_ts(sa_item) # Returns the ts object ipi_c_eu[, "FR"]

  # Extracting from a multiprocessing:
# Returns a list of length 1 named "X13" containing the ts object ipi_c_eu[, "FR"]:
get_ts(mp)


  # Extracting from a workspace:
# Returns a list of length 1 named "sa1" containing a list
# of length 1 named "X13" containing the ts object ipi_c_eu[, "FR"]
get_ts(wk)
## End(No test)



