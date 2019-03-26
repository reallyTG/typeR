library(jstor)


### Name: jst_import
### Title: Wrapper for file import
### Aliases: jst_import jst_import_zip

### ** Examples

## Not run: 
##D # read from file list --------
##D # find all files
##D meta_files <- list.files(pattern = "xml", full.names = T)
##D 
##D # import them via `jst_get_article`
##D jst_import(meta_files, out_file = "imported_metadata", .f = jst_get_article,
##D            files_per_batch = 25000)
##D            
##D # do the same, but in parallel
##D library(future)
##D plan(multiprocess)
##D jst_import(meta_files, out_file = "imported_metadata", .f = jst_get_article,
##D            files_per_batch = 25000)
##D 
##D # read from zip archive ------ 
##D # define imports
##D imports <- jst_define_import(article = c(jst_get_article, jst_get_authors))
##D 
##D # convert the files to .csv
##D jst_import_zip("my_archive.zip", out_file = "my_out_file", 
##D                  import_spec = imports)
## End(Not run) 



