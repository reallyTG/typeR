library(dynatopmodel)


### Name: build_routing_table
### Title: Generate a network routing table
### Aliases: build_routing_table

### ** Examples

## Not run: 
##D # Create a routing table for the Brompton test case and show histogram
##D 
##D data(brompton)
##D 
##D tab <- build_routing_table(brompton$dem,
##D   chans=brompton$reaches,
##D   breaks=5)
##D barplot(tab[,2]*100, xlab="Mean flow distance to outlet (m)",
##D ylab="Network Width %", names.arg=tab[,1])
## End(Not run)



