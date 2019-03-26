library(configr)


### Name: is.ini.file
### Title: Function to check wheather file is INI format
### Aliases: is.ini.file

### ** Examples

config.json <- system.file('extdata', 'config.json', package='configr')
config.ini <- system.file('extdata', 'config.ini', package='configr')
config.yaml <- system.file('extdata', 'config.yaml', package='configr')
config.toml <- system.file('extdata', 'config.toml', package='configr')
print(is.ini.file(config.ini))
print(is.ini.file(config.json))
print(is.ini.file(config.yaml))
print(is.ini.file(config.toml))



