library(rerddap)


### Name: info
### Title: Get information on an ERDDAP dataset.
### Aliases: info as.info

### ** Examples

## Not run: 
##D # grid dap datasets
##D info('erdATastnhday')
##D 
##D (out <- ed_search(query='temperature'))
##D info(out$info$dataset_id[5])
##D info(out$info$dataset_id[15])
##D info(out$info$dataset_id[25])
##D info(out$info$dataset_id[150])
##D info(out$info$dataset_id[400])
##D info(out$info$dataset_id[678])
##D 
##D out <- info(datasetid='erdMBchla1day')
##D ## See brief overview of the variables and range of possible values, if given
##D out$variables
##D ## all information on longitude
##D out$alldata$longitude
##D ## all information on chlorophyll
##D out$alldata$chlorophyll
##D 
##D # table dap datasets
##D (out <- ed_search(query='temperature', which = "table"))
##D info(out$info$dataset_id[1])
##D info(out$info$dataset_id[2])
##D info(out$info$dataset_id[3])
##D info(out$info$dataset_id[4])
##D 
##D info('erdCinpKfmBT')
##D out <- info('erdCinpKfmBT')
##D ## See brief overview of the variables and range of possible values, if given
##D out$variables
##D ## all information on longitude
##D out$alldata$longitude
##D ## all information on Haliotis_corrugata_Mean_Density
##D out$alldata$Haliotis_corrugata_Mean_Density
##D 
##D # use a different ERDDAP server
##D ## Marine Institute (Ireland)
##D info("IMI_CONN_2D", url = "http://erddap.marine.ie/erddap/")
## End(Not run)



