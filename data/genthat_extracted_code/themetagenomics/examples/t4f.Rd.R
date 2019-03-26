library(themetagenomics)


### Name: t4f
### Title: Predict taxonomic functional content via tax4fun
### Aliases: t4f

### ** Examples

## Not run: 
##D download_ref(destination='/references',reference='silva_ko')
##D predicted_functions <- t4f(otu_table=DAVID$OTU,rows_are_taxa=FALSE,
##D                            tax_table=DAVID$TAX,reference='/references',
##D                            type='uproc',short=TRUE,cn_normalize=TRUE,
##D                            sample_normalize=FALSE,scalar=NULL,drop=TRUE)
##D                            
## End(Not run)




