library(configr)


### Name: eval.config.merge
### Title: Merge config parameter sets by sections.
### Aliases: eval.config.merge

### ** Examples

config.json <- system.file('extdata', 'config.json', package='configr')
config.ini <- system.file('extdata', 'config.ini', package='configr')
config.yaml <- system.file('extdata', 'config.yaml', package='configr')
config.toml <- system.file('extdata', 'config.toml', package='configr')
eval.config.merge(config.json)
eval.config.merge(config.ini)
eval.config.merge(config.yaml)
eval.config.merge(config.toml)



