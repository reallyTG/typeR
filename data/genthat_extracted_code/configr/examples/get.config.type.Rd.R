library(configr)


### Name: get.config.type
### Title: Get config file type retreiving json/ini/yaml or FALSE
### Aliases: get.config.type

### ** Examples

config.json <- system.file('extdata', 'config.json', package='configr')
config.ini <- system.file('extdata', 'config.ini', package='configr')
config.yaml <- system.file('extdata', 'config.yaml', package='configr')
config.toml <- system.file('extdata', 'config.toml', package='configr')
get.config.type(file=config.json)
get.config.type(file=config.ini)
get.config.type(file=config.yaml)
get.config.type(file=config.toml)



