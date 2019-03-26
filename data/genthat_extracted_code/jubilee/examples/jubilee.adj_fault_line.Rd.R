library(jubilee)


### Name: jubilee.adj_fault_line
### Title: Adjust the time series by fault lines
### Aliases: jubilee.adj_fault_line
### Keywords: model

### ** Examples

## Not run: 
##D   repo <- jubilee.repo(online=FALSE)
##D   dj <- jubilee(repo@ie, 45, 10)@reg.dtb
##D   dj$log.cape10.adj <- jubilee.adj_fault_line(dj$fraction, dj$log.cape10, "r_nom_f10_5ftr_4fl")
## End(Not run)




