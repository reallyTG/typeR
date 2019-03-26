library(rgbif)


### Name: gbif_citation
### Title: Get citation for datasets used
### Aliases: gbif_citation

### ** Examples

## Not run: 
##D res1 <- occ_search(taxonKey=9206251, limit=2)
##D (xx <- gbif_citation(res1))
##D 
##D res2 <- occ_search(datasetKey='7b5d6a48-f762-11e1-a439-00145eb45e9a',
##D  return='data', limit=20)
##D (xx <- gbif_citation(res2))
##D 
##D # if no datasetKey field included, we attempt to identify the dataset
##D ## key field included - still works
##D res3 <- occ_search(taxonKey=9206251, fields=c('name','basisOfRecord','key'),
##D   limit=20)
##D (xx <- gbif_citation(res3))
##D ## key field not included - errors
##D # res3 <- occ_search(taxonKey=9206251, fields=c('name','basisOfRecord','
##D #    protocol'), limit=20)
##D # (xx <- gbif_citation(res3))
##D 
##D # character class inputs
##D ## pass in a dataset key
##D gbif_citation(x='0ec3229f-2b53-484e-817a-de8ceb1fce2b')
##D ## pass in an occurrence key
##D gbif_citation(x='1425976049')
##D 
##D # pass in an occurrence key as a numeric (won't work for a dataset key)
##D gbif_citation(x=1425976049)
##D 
##D # Downloads
##D ## occ_download_get()
##D # d1 <- occ_download("country = BG", "year <= 2011")
##D # key <- "0000122-171020152545675"
##D # occ_download_meta(key)
##D # d1 <- occ_download_get(key, overwrite = TRUE)
##D # gbif_citation(d1)
##D 
##D ## occ_download_meta()
##D # key <- "0000122-171020152545675"
##D # res <- occ_download_meta(key)
##D # gbif_citation(res)
## End(Not run)



