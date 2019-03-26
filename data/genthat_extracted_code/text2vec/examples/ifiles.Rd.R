library(text2vec)


### Name: ifiles
### Title: Creates iterator over text files from the disk
### Aliases: ifiles idir ifiles_parallel

### ** Examples

## Not run: 
##D current_dir_files = list.files(path = ".", full.names = TRUE)
##D files_iterator = ifiles(current_dir_files)
##D parallel_files_iterator = ifiles_parallel(current_dir_files, n_chunks = 4)
##D it = itoken_parallel(parallel_files_iterator)
##D dtm = create_dtm(it, hash_vectorizer(2**16), type = 'dgTMatrix')
## End(Not run)
dir_files_iterator = idir(path = ".")



