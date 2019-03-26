library(ecb)


### Name: get_data
### Title: Retrieve data from the ECB Statistical Data Warehouse API
### Aliases: get_data

### ** Examples

# Get monthly data on annualized euro area headline HICP
hicp <- get_data("ICP.M.U2.N.000000.4.ANR")
head(hicp)



