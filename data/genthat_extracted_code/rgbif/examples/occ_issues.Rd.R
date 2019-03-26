library(rgbif)


### Name: occ_issues
### Title: Parse and examine further GBIF issues on a dataset
### Aliases: occ_issues

### ** Examples

## Not run: 
##D ## what do issues mean, can print whole table, or search for matches
##D head(gbif_issues())
##D iss <- c('cdround','cudc','gass84','txmathi')
##D gbif_issues()[ gbif_issues()$code %in% iss, ]
##D 
##D # compare out data to after occ_issues use
##D (out <- occ_search(limit=100))
##D out %>% occ_issues(cdround)
##D 
##D # occ_data
##D (out <- occ_data(limit=100))
##D out %>% occ_issues(cdround)
##D 
##D # Parsing output by issue
##D (res <- occ_data(
##D   geometry='POLYGON((30.1 10.1, 10 20, 20 40, 40 40, 30.1 10.1))',
##D   limit = 600))
##D 
##D ## or parse issues in various ways
##D ### inlude only rows with cdround issue
##D gg <- res %>% occ_issues(cdround)
##D NROW(res$data)
##D NROW(gg$data)
##D head(res$data)[,c(1:5)]
##D head(gg$data)[,c(1:5)]
##D 
##D ### remove data rows with certain issue classes
##D res %>% occ_issues(-cdround, -cudc)
##D 
##D ### split issues into separate columns
##D res %>% occ_issues(mutate = "split")
##D res %>% occ_issues(-cudc, -mdatunl, mutate = "split")
##D res %>% occ_issues(gass84, mutate = "split")
##D 
##D ### expand issues to more descriptive names
##D res %>% occ_issues(mutate = "expand")
##D 
##D ### split and expand
##D res %>% occ_issues(mutate = "split_expand")
##D 
##D ### split, expand, and remove an issue class
##D res %>% occ_issues(-cdround, mutate = "split_expand")
##D 
##D ## Or you can use occ_issues without the pipe
##D occ_issues(res, -cdround, mutate = "split_expand")
##D 
##D # from GBIF downloaded data via occ_download and friends
##D res <- occ_download_get(key="0000066-140928181241064", overwrite=TRUE)
##D x <- occ_download_import(res)
##D occ_issues(x, -txmathi)
##D occ_issues(x, txmathi)
##D occ_issues(x, gass84)
##D occ_issues(x, zerocd)
##D occ_issues(x, gass84, txmathi)
##D occ_issues(x, mutate = "split")
##D occ_issues(x, -gass84, mutate = "split")
##D occ_issues(x, mutate = "expand")
##D occ_issues(x, mutate = "split_expand")
##D 
##D # occ_search/occ_data with many inputs - give slightly different output
##D # format than normal 2482598, 2498387
##D xyz <- occ_data(taxonKey = c(9362842, 2492483, 2435099), limit = 300)
##D xyz
##D length(xyz) # length 3
##D names(xyz) # matches taxonKey values passed in
##D occ_issues(xyz, -gass84)
##D occ_issues(xyz, -cdround)
##D occ_issues(xyz, -cdround, -gass84)
## End(Not run)



