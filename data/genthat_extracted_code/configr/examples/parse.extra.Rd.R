library(configr)


### Name: parse.extra
### Title: Parse the configuration var format, and replace it by extra.list
###   values
### Aliases: parse.extra

### ** Examples

config.json <- system.file('extdata', 'config.json', package='configr')
config.other <- system.file('extdata', 'config.other.yaml', package='configr')
config <- read.config(config.json)
parse.extra(config, list(debug = 'TRUE'))
parse.extra(config, list(debug = 'TRUE'), other.config = config.other)
parse.extra(config, list(debug = 'TRUE'), other.config = config.other, 
rcmd.parse = TRUE)
parse.extra(config, list(debug = 'TRUE'), other.config = config.other, 
rcmd.parse = TRUE, bash.parse = TRUE)

raw <- c('a', '!!glue{1:5}', 'c')
expect.parsed.1 <- c('a', '1', '2', '3', '4', '5', 'c')
list.raw <- list(glue = raw, nochange = 1:10)
parsed <- parse.extra(list.raw, glue.parse = TRUE)

raw <- c('!!glue_numeric{1:5}')
expect.parsed.1 <- c(1, 2, 3, 4, 5)
list.raw <- list(glue = raw, nochange = 1:10)
parsed <- parse.extra(list.raw, glue.parse = TRUE)



