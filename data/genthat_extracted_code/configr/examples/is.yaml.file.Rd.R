library(configr)


### Name: is.yaml.file
### Title: Function to check wheather file is YAML format
### Aliases: is.yaml.file

### ** Examples

config.json <- system.file('extdata', 'config.json', package='configr')
config.ini <- system.file('extdata', 'config.ini', package='configr')
config.yaml <- system.file('extdata', 'config.yaml', package='configr')
config.toml <- system.file('extdata', 'config.toml', package='configr')
print(is.yaml.file(config.yaml))
print(is.yaml.file(config.json))
print(is.yaml.file(config.ini))
print(is.yaml.file(config.toml))



