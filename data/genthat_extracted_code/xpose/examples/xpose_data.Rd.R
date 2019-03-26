library(xpose)


### Name: xpose_data
### Title: Import NONMEM output into R
### Aliases: xpose_data

### ** Examples

## Not run: 
##D # Using the `file` argument to point to the model file:
##D xpdb <- xpose_data(file = 'run001.lst', dir = 'models')
##D 
##D # Using the `runno` argument to point to the model file:
##D xpdb <- xpose_data(runno = '001', ext = '.lst', dir = 'models')
##D 
##D # Using the `extra_files` argument to import specific output files only:
##D xpdb <- xpose_data(file = 'run001.lst', dir = 'models', extra_files = c('.ext', '.phi'))
##D 
##D # Using `ignore` to disable import of tables and output files:
##D xpdb <- xpose_data(file = 'run001.lst', dir = 'models', ignore = c('data', 'files'))
##D 
##D # Using `simtab` to disable import of simulation tables
##D xpdb <- xpose_data(file = 'run001.lst', dir = 'models', simtab = FALSE)
##D 
## End(Not run)




