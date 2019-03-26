library(canprot)


### Name: groupplots
### Title: Plot Potential Diagrams for Groups of Datasets
### Aliases: groupplots mergedplot

### ** Examples

## Not run: 
##D data(canprot)
##D gpresult <- groupplots("osmotic_H2O_down", res=25)
##D mergedplot(gpresult, res=25)
##D 
##D # reproduce Figure 4 of Dick, 2017
##D ZCgroups <- c("CRC_ZC_up","pancreatic_ZC_up", "hypoxia_ZC_down")
##D H2Ogroups <- c("CRC_H2O_up", "pancreatic_H2O_up", "osmotic_H2O_down")
##D allgroups <- c(ZCgroups, H2Ogroups)
##D par(mfrow=c(2, 3))
##D for(group in allgroups) {
##D   gpresult <- groupplots(group, plot.it=FALSE)
##D   mergedplot(gpresult)
##D   title(main=group)
##D }
## End(Not run)



