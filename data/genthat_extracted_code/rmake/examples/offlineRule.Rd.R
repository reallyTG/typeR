library(rmake)


### Name: offlineRule
### Title: Rule for requesting manual user action
### Aliases: offlineRule

### ** Examples

r <- offlineRule(target='offlinedata.csv',
                 message='Please re-generate manually offlinedata.csv',
                 depends=c('source1.csv', 'source2.csv'))

# generate the content of a makefile (as character vector)
makefile(list(r))

# generate to file
tmp <- tempdir()
makefile(list(r), file.path(tmp, "Makefile"))



