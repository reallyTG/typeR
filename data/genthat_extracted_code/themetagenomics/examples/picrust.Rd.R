library(themetagenomics)


### Name: picrust
### Title: Predict OTU functional content via PICRUSt
### Aliases: picrust

### ** Examples

## Not run: 
##D download_ref(destination='/references',reference='gg_ko')
##D 
##D predicted_functions <- picrust(otu_table=GEVERS$OTU,rows_are_taxa=TRUE,
##D                                reference='gg_ko',reference_path='/references',
##D                                cn_normalize=TRUE,
##D                                sample_normalize=FALSE,drop=TRUE)
##D                            
## End(Not run)




