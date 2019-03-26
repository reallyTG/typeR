library(RJDemetra)


### Name: get_object
### Title: Get objects inside a workspace or multiprocessing
### Aliases: get_object get_all_objects

### ** Examples

## No test: 

sa_x13 <- x13_def(ipi_c_eu[, "FR"], spec = "RSA5c")

wk <- new_workspace()
mp <- new_multiprocessing(wk, "sa1")
add_sa_item(wk, "sa1", sa_x13, "X13")

# Other way to get the multiprocessing:
mp <- get_object(wk, 1)
# To get the sa_item object:
sa_item <- get_object(mp, 1)
## End(No test)



