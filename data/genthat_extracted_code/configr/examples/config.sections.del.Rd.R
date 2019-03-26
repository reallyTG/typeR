library(configr)


### Name: config.sections.del
### Title: Delete sections in config, just do config[sections] <- NULL
### Aliases: config.sections.del

### ** Examples

config.json <- system.file('extdata', 'config.json', package = 'configr')
config <- read.config(config.json, file.type = 'json')
config <- config.sections.del(config, 'default')



