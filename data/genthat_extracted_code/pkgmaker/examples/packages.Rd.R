library(pkgmaker)


### Name: require.quiet
### Title: Loading Packages
### Aliases: require.quiet qrequire qlibrary mrequire

### ** Examples

## Don't show: 
options(R_CHECK_RUNNING_EXAMPLES_=TRUE) ## roxygen generated flag
## End(Don't show)


mrequire('Running this example', 'stringr')
try( mrequire('Doing impossible things', 'notapackage') )




