library(RJDemetra)


### Name: add_sa_item
### Title: Add a seasonnaly adjust model to a multi-processing
### Aliases: add_sa_item

### ** Examples

## No test: 
dir <- tempdir()
spec_x13 <- x13_spec_def(spec = "RSA5c", easter.enabled = FALSE)
sa_x13 <- x13(ipi_c_eu[, "FR"], spec = spec_x13)
spec_ts <- tramoseats_spec_def(spec = "RSA5")
sa_ts <- tramoseats(ipi_c_eu[, "FR"], spec = spec_ts)

wk <- new_workspace()
new_multiprocessing(wk, "sa1")
add_sa_item(wk, "sa1", sa_x13, "X13")
add_sa_item(wk, "sa1", sa_ts, "TramoSeats")

save_workspace(wk, file.path(dir, "workspace.xml"))
## End(No test)




