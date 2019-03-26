library(pkgmaker)


### Name: file_extension
### Title: Extract File Extension
### Aliases: file_extension

### ** Examples

## Don't show: 
options(R_CHECK_RUNNING_EXAMPLES_=TRUE) ## roxygen generated flag
## End(Don't show)


file_extension('alpha.txt')
file_extension(paste('aa.tt', 1:5, sep=''))
# change extension
file_extension(paste('aa.tt', 1:5, sep=''), 'pdf')
file_extension(paste('aatt', 1:5, sep=''), 'pdf')




