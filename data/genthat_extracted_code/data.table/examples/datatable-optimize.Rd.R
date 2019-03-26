library(data.table)


### Name: datatable.optimize
### Title: Optimisations in data.table
### Aliases: datatable-optimize datatable.optimize data.table-optimize
###   data.table.optimize gforce GForce autoindex autoindexing auto-index
###   auto-indexing rounding
### Keywords: data

### ** Examples

## Not run: 
##D # Generate a big data.table with a relatively many columns
##D set.seed(1L)
##D DT = lapply(1:20, function(x) sample(c(-100:100), 5e6L, TRUE))
##D setDT(DT)[, id := sample(1e5, 5e6, TRUE)]
##D print(object.size(DT), units="Mb") # 400MB, not huge, but will do
##D 
##D # 'order' optimisation
##D options(datatable.optimize = 1L) # optimisation 'on'
##D system.time(ans1 <- DT[order(id)])
##D options(datatable.optimize = 0L) # optimisation 'off'
##D system.time(ans2 <- DT[order(id)])
##D identical(ans1, ans2)
##D 
##D # optimisation of 'lapply(.SD, fun)'
##D options(datatable.optimize = 1L) # optimisation 'on'
##D system.time(ans1 <- DT[, lapply(.SD, min), by=id])
##D options(datatable.optimize = 0L) # optimisation 'off'
##D system.time(ans2 <- DT[, lapply(.SD, min), by=id])
##D identical(ans1, ans2)
##D 
##D # optimisation of 'mean'
##D options(datatable.optimize = 1L) # optimisation 'on'
##D system.time(ans1 <- DT[, lapply(.SD, mean), by=id])
##D system.time(ans2 <- DT[, lapply(.SD, base::mean), by=id])
##D identical(ans1, ans2)
##D 
##D # optimisation of 'c(.N, lapply(.SD, ))'
##D options(datatable.optimize = 1L) # optimisation 'on'
##D system.time(ans1 <- DT[, c(.N, lapply(.SD, min)), by=id])
##D options(datatable.optimize = 0L) # optimisation 'off'
##D system.time(ans2 <- DT[, c(N=.N, lapply(.SD, min)), by=id])
##D identical(ans1, ans2)
##D 
##D # GForce
##D options(datatable.optimize = 2L) # optimisation 'on'
##D system.time(ans1 <- DT[, lapply(.SD, median), by=id])
##D system.time(ans2 <- DT[, lapply(.SD, function(x) as.numeric(stats::median(x))), by=id])
##D identical(ans1, ans2)
##D 
##D # optimized subsets
##D options(datatable.optimize = 2L)
##D system.time(ans1 <- DT[id == 100L]) # vector scan
##D system.time(ans2 <- DT[id == 100L]) # vector scan
##D system.time(DT[id %in% 100:500])    # vector scan
##D 
##D options(datatable.optimize = 3L)
##D system.time(ans1 <- DT[id == 100L]) # index + binary search subset
##D system.time(ans2 <- DT[id == 100L]) # only binary search subset
##D system.time(DT[id %in% 100:500])    # only binary search subset again
##D 
## End(Not run)


