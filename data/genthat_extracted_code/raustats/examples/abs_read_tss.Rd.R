library(raustats)


### Name: abs_read_tss
### Title: Read ABS time series data file(s)
### Aliases: abs_read_tss

### ** Examples

  ## No test: 
    ## Read specified ABS Excel time series files
    tables <- abs_cat_tables("5206.0", releases="Latest", include_urls=TRUE);
    downloaded_tables <- abs_cat_download(tables$path_2[1], exdir=tempdir())
    extracted_files <- abs_cat_unzip(downloaded_tables)
    x <- abs_read_tss(extracted_files);
  
## End(No test)



