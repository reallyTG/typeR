library(configr)


### Name: str2config
### Title: Parse configuration string to R list object.
### Aliases: str2config

### ** Examples

json_string <- '{"city" : "Crich"}\n'
yaml_string <- 'foo: 123\n'
json_config <- str2config(json_string)
yaml_config <- str2config(yaml_string)



