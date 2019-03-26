library(GetLattesData)


### Name: gld_get_lattes_data_from_zip
### Title: Reads zip files from Lattes
### Aliases: gld_get_lattes_data_from_zip

### ** Examples


## Not run: 
##D # get files from pkg (you can download from other researchers in lattes website)
##D f.in <- system.file('extdata/3262699324398819.zip', package = 'GetLattesData')
##D 
##D # set qualis
##D field.qualis = 'ECONOMIA'
##D 
##D # get data
##D l.out <- gld_get_lattes_data_from_zip(f.in, field.qualis = field.qualis )
##D 
##D # print it
##D print(l.out$tpesq)
##D print(l.out$tpublic.published)
## End(Not run)



