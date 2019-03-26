library(configr)


### Name: is.toml.file
### Title: Function to check wheather file is TOML format
### Aliases: is.toml.file

### ** Examples

config.json <- system.file('extdata', 'config.json', package='configr')
config.ini <- system.file('extdata', 'config.ini', package='configr')
config.yaml <- system.file('extdata', 'config.yaml', package='configr')
config.toml <- system.file('extdata', 'config.toml', package='configr')
print(is.toml.file(config.json))
print(is.toml.file(config.ini))
print(is.toml.file(config.yaml))
print(is.toml.file(config.toml))



