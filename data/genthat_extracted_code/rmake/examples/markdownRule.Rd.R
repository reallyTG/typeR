library(rmake)


### Name: markdownRule
### Title: Rule for building text documents from Markdown files
### Aliases: markdownRule

### ** Examples

r <- markdownRule(target='report.pdf',
                  script='report.Rmd',
                  depends=c('data1.csv', 'data2.csv'))

# generate the content of a makefile (as character vector)
makefile(list(r))

# generate to file
tmp <- tempdir()
makefile(list(r), file.path(tmp, "Makefile"))



