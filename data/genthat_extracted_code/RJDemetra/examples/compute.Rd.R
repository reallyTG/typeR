library(RJDemetra)


### Name: compute
### Title: Compute the multi-processing from a workspace
### Aliases: compute

### ** Examples

## No test: 
spec_x13 <- x13_spec_def(spec = "RSA5c", easter.enabled = FALSE)
sa_x13 <- x13(ipi_c_eu[, "FR"], spec = spec_x13)

wk <- new_workspace()
mp <- new_multiprocessing(wk, "sa1")
add_sa_item(wk, "sa1", sa_x13, "X13")
sa_item1 <- get_object(mp, 1)

get_model(sa_item1, wk) # Returns NULL

compute(wk)

get_model(sa_item1, wk) # Returns the SA model sa_x13
## End(No test)





