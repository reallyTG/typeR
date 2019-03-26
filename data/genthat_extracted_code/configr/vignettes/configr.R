## ---- echo = FALSE-------------------------------------------------------
knitr::opts_chunk$set(comment = "#>", collapse = TRUE)

## ------------------------------------------------------------------------
library(configr)
config.json <- system.file('extdata', 'config.json', package='configr')
config.ini <- system.file('extdata', 'config.ini', package='configr')
config.yaml <- system.file('extdata', 'config.yaml', package='configr')
config.toml <- system.file('extdata', 'config.toml', package='configr')

## ---- echo = TRUE--------------------------------------------------------
is.json.file(config.json)
is.toml.file(config.toml)
is.ini.file(config.ini)
is.yaml.file(config.yaml)
get.config.type(config.json)
get.config.type(config.yaml)
get.config.type(config.ini)
get.config.type(config.toml)

## ---- echo = TRUE--------------------------------------------------------
eval.config.sections(config.ini)
eval.config.sections(config.toml)

## ---- echo = TRUE--------------------------------------------------------
# Read in R as a list (JSON/INI/YAML/TOML be suported)
# fromJSON/read.ini/readLines/yaml.load  parameters can be automatch by parameter name (encoding .etc.)
read.config(file = config.toml)

## ---- echo = TRUE--------------------------------------------------------
# Get the same obj with config package, only get the 
# 'default or R_CONFIG_ACTIVE config sets' in config.cfg or R_CONFIGFILE_ACTIVE
eval.config(file = config.yaml)

# Read designated section
eval.config(file = config.json, config = "comments")

# Read designated section with its one value
eval.config(file = config.ini, config = "comments", value = "version")

## ---- echo = TRUE--------------------------------------------------------
eval.config.merge(file = config.json, sections = c('default', 'comments'))
eval.config.merge(file = config.toml, sections = c('default', 'comments'))

## ---- echo = TRUE--------------------------------------------------------
links <- c("https://raw.githubusercontent.com/JhuangLab/BioInstaller/master/inst/extdata/config/db/db_annovar.toml", 
           "https://raw.githubusercontent.com/JhuangLab/BioInstaller/master/inst/extdata/config/db/db_main.toml", 
           system.file('extdata', 'config.toml', package = "configr"))
x <- fetch.config(links)
x[c(1:5, length(x))]

## ---- echo = TRUE--------------------------------------------------------
# Convert YAML configuration file to JSON format
out.json <- tempfile(fileext = ".json")
convert.config(file = config.yaml, out.file = out.json, convert.to = "JSON")
get.config.type(out.json)

# Generate a JSON format configuration file
list.test <- list(a=c(123,456))
out.fn <- sprintf("%s/test.json", tempdir())
write.config(config.dat = list.test, file.path = out.fn, write.type = "json")
get.config.type(out.fn)

# Generate a YAML format configuration file with defined indent
write.config(config.dat = list.test, file.path = out.fn, write.type = "yaml", indent = 4)
get.config.type(out.fn)

# Generate a YAML format configuration file with defined indent and pointed sections
#write.config(config.dat = list.test, file.path = out.fn, write.type = "yaml", sections = "a", indent = 4)
#get.config.type(out.fn)

## ---- echo = TRUE--------------------------------------------------------
other.config <- system.file('extdata', 'config.other.yaml', package='configr')

read.config(file = other.config)

config.1 <- read.config(file = config.json)
config.1$default
read.config(file = config.json, extra.list = list(debug = "self", debug2 = "self2"))$default

sections <- c('default', 'other_config_parse')
config.1[sections]
read.config(file = config.json, extra.list = list(debug = "self", debug2 = "self2"), 
  other.config = other.config)[sections]

sections <- c('default', 'other_config_parse', 'rcmd_parse')
# The followed two line command will return the same value
config.1[sections]
read.config(file = config.json, extra.list = list(debug = "self", debug2 = "self2"), 
  other.config = other.config, rcmd.parse = T)[sections]
parse.extra(config.1, extra.list = list(debug = "self", debug2 = "self2"), 
  other.config = other.config, rcmd.parse = T)[sections]


sections <- c('default', 'other_config_parse', 'rcmd_parse', 'mulitple_parse')
config.1[sections]
parse.extra(config.1, extra.list = list(debug = "self", debug2 = "self2", yes = "1", no = "0"), 
  other.config = other.config, rcmd.parse = T, bash.parse = T)[sections]

# glue parse
raw <- c("a", "!!glue{1:5}", "c")
list.raw <- list(glue = raw, nochange = 1:10)
list.raw
expect.parsed.1 <- c("a", "1", "2", "3", "4", "5", "c")
expect.parsed.2 <- list(glue = expect.parsed.1, nochange = 1:10)
parse.extra(list.raw, glue.parse = TRUE, glue.flag = "!!glue")


## ---- echo = TRUE--------------------------------------------------------
config <- read.config(file = config.json, extra.list = list(debug = "self", debug2 = "self2"), 
  other.config = other.config)[sections]
names(config)
config <- config.sections.del(config, 'default')
names(config)

## ---- echo = TRUE--------------------------------------------------------
json_string <- '{"city" : "Crich"}\n'
yaml_string <- 'foo: 123\n'
json_config <- str2config(json_string)
yaml_config <- str2config(yaml_string)
print(json_config)
print(yaml_config)

## ----echo=FALSE----------------------------------------------------------
sessionInfo()

