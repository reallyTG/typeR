library(configr)


### Name: eval.config
### Title: Read from the currently active configuration (JSON/INI/YAML/TOML
###   be supported), 'retreiving either a single named value or all values
###   as a config obj which have 'config', 'configtype', 'file' 'property.
### Aliases: eval.config

### ** Examples

config.json <- system.file('extdata', 'config.json', package='configr')
config <- eval.config(file=config.json)
config.extra.parsed.1 <- eval.config(file = config.json, extra.list = list(debug = 'TRUE'))
other.config <- system.file('extdata', 'config.other.yaml', package='configr')
config.extra.parsed.2 <- eval.config(file = config.json, extra.list = list(debug = 'TRUE'), 
other.config = other.config)



