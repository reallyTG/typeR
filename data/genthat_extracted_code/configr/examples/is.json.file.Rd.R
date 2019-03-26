library(configr)


### Name: is.json.file
### Title: Function to check wheather file is JSON format
### Aliases: is.json.file

### ** Examples

config.json <- system.file('extdata', 'config.json', package='configr')
config.ini <- system.file('extdata', 'config.ini', package='configr')
config.yaml <- system.file('extdata', 'config.yaml', package='configr')
config.toml <- system.file('extdata', 'config.toml', package='configr')
print(is.json.file(config.json))
print(is.json.file(config.ini))
print(is.json.file(config.yaml))
print(is.json.file(config.toml))



