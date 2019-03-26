library(pkgmaker)


### Name: write.pkgbib
### Title: Generate a Bibtex File from Package Citations
### Aliases: write.pkgbib

### ** Examples

## Don't show: 
options(R_CHECK_RUNNING_EXAMPLES_=TRUE) ## roxygen generated flag
## End(Don't show)


write.pkgbib(c('bibtex', 'utils', 'tools'), file='references')
bibs <- bibtex::read.bib('references.bib')
write.pkgbib(bibs, 'references2.bib')
md5 <- tools::md5sum(c('references.bib', 'references2.bib'))
md5[1] == md5[2]
## Don't show: 
 stopifnot(md5[1] == md5[2]) 
## End(Don't show)

# write to stdout()
write.pkgbib(c('bibtex', 'utils', 'tools'), file=NULL)

# clean up 
unlink(c('references.bib', 'references2.bib'))




