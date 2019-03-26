library(RJDemetra)


### Name: get_model
### Title: Get the seasonally adjusted model from a workspace
### Aliases: get_model

### ** Examples

## No test: 
spec_x13 <- x13_spec_def(spec = "RSA5c", easter.enabled = FALSE)
sa_x13 <- x13(ipi_c_eu[, "FR"], spec = spec_x13)
spec_ts <- tramoseats_spec_def(spec = "RSA5")
sa_ts <- tramoseats(ipi_c_eu[, "FR"], spec = spec_ts)

wk <- new_workspace()
mp <- new_multiprocessing(wk, "sa1")
add_sa_item(wk, "sa1", sa_x13, "X13")
add_sa_item(wk, "sa1", sa_ts, "TramoSeats")

compute(wk) # It's important to compute the workspace to get the SA model
sa_item1 <- get_object(mp, 1)

get_model(sa_item1, wk) # Extract the model of the sa_item1: its the object sa_x13

# To get all the models of the multiprocessing mp:
get_model(mp, wk)

# To get all the models of the workspace wk:
get_model(wk)
## End(No test)




