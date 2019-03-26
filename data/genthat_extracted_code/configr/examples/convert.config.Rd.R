library(configr)


### Name: convert.config
### Title: Covert configuration file from JSON/INI/YAML/TOML to
###   JSON/INI/YAML
### Aliases: convert.config

### ** Examples

config.json <- system.file('extdata', 'config.json', package='configr')
config <- convert.config(file=config.json, out.file = sprintf('%s/config.ini', tempdir()))



