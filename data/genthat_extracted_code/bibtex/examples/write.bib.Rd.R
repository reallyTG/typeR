library(bibtex)


### Name: write.bib
### Title: Generate a Bibtex File from Package Citations
### Aliases: write.bib

### ** Examples


write.bib(c('bibtex', 'utils', 'tools'), file='references')
bibs <- read.bib('references.bib')
write.bib(bibs, 'references2.bib')
md5 <- tools::md5sum(c('references.bib', 'references2.bib'))
md5[1] == md5[2]




