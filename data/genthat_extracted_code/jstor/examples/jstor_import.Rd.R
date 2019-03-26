library(jstor)


### Name: jstor_import
### Title: Defunct: Wrapper for file import
### Aliases: jstor_import

### ** Examples

## Not run: 
##D # read from file list --------
##D # find all files
##D meta_files <- list.files(pattern = "xml", full.names = T)
##D 
##D # import them via `find_article`
##D jstor_import(meta_files, out_file = "imported_metadata", .f = find_article,
##D              files_per_batch = 25000, cores = 4)
##D 
##D # read from zip archive ------ 
##D # define imports
##D imports <- jst_define_import(article = c(find_article, find_authors))
##D 
##D # convert the files to .csv
##D jstor_import_zip("my_archive.zip", out_file = "my_out_file", 
##D                  import_spec = imports)
## End(Not run) 



