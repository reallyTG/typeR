library(ngstk)


### Name: set_tools
### Title: Function to generate tools path object
### Aliases: set_tools

### ** Examples

config.file <- system.file('extdata', 'demo/tools_config.json', package = 'ngstk')
config.list <- list(gatk = '/path/gatk')
config.vec <- c('/path/samtools')
names(config.vec) <- 'samtools'
tools <- set_tools(config.file, config.list, config.vec,
                  eval.params = list(config = 'tools'))



