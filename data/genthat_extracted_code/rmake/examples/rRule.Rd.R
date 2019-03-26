library(rmake)


### Name: rRule
### Title: Rule for running R scripts
### Aliases: rRule

### ** Examples

r <- rRule(target='cleandata.csv',
           script='clean.R',
           depends=c('data1.csv', 'data2.csv'))

# generate the content of a makefile (as character vector)
makefile(list(r))

# generate to file
tmp <- tempdir()
makefile(list(r), file.path(tmp, "Makefile"))



