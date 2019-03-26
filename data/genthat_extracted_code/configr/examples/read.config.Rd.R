library(configr)


### Name: read.config
### Title: Read from the file (JSON/INI/YAML/TOML be supported), retreiving
###   all values as a list.
### Aliases: read.config

### ** Examples

config.json <- system.file('extdata', 'config.json', package='configr')
config <- read.config(file=config.json)
config.extra.parsed.1 <- read.config(config.json, list(debug = 'TRUE'))
other.config <- system.file('extdata', 'config.other.yaml', package='configr')
config.extra.parsed.2 <- read.config(config.json, list(debug = 'TRUE'), other.config)



