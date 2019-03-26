library(rmake)


### Name: rule
### Title: General creator of an instance of the S3 'rmake.rule' class
### Aliases: rule rmake.rule

### ** Examples

r <- rule(target='something.abc',
          depends=c('file.a', 'file.b', 'file.c'),
          build='myCompiler file.a file.b file.c -o something.abc',
          clean='$(RM) something.abc')

# generate the content of a makefile (as character vector)
makefile(list(r))

# generate to file
tmp <- tempdir()
makefile(list(r), file.path(tmp, "Makefile"))



