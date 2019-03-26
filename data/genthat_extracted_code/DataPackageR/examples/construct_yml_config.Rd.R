library(DataPackageR)


### Name: construct_yml_config
### Title: Construct a datapackager.yml configuration
### Aliases: construct_yml_config

### ** Examples

conf <- construct_yml_config(code = c('file1.rmd','file2.rmd'), data=c('object1','object2'))
tmp <- normalizePath(tempdir(), winslash = "/")
yml_write(conf,path=tmp)



