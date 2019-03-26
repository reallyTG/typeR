library(configr)


### Name: write.config
### Title: Write config in a file (JSON/YAML/INI)
### Aliases: write.config

### ** Examples

list.test <- list(a=c(123,456))
out.yaml <- sprintf('%s/test.yaml', tempdir()) 
write.config(list.test, out.yaml, write.type = 'yaml')



