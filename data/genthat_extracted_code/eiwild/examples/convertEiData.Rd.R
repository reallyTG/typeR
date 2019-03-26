library(eiwild)


### Name: convertEiData
### Title: Extracting important values for ecological Inference
### Aliases: convertEiData

### ** Examples

## Not run: 
##D # loading some fake election data
##D data(topleveldat)
##D form <- cbind(CSU_2, SPD_2, LINK_2, GRUN_2) ~ cbind(CSU_1, SPD_1, Link_1)
##D 
##D conv <- convertEiData(form=form, aggr=aggr, indi=indi, IDCols=c("ID", "ID"))
##D 
##D str(conv)
## End(Not run)



