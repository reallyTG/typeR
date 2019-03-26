library(logger)


### Name: layout_glue_generator
### Title: Generate log layout function using common variables available
###   via glue syntax
### Aliases: layout_glue_generator

### ** Examples

## Not run: 
##D example_layout <- layout_glue_generator(
##D   format = '{node}/{pid}/{ns}/{ans}/{topenv}/{fn} {time} {level}: {msg}')
##D example_layout(INFO, 'try {runif(1)}')
##D 
##D log_layout(example_layout)
##D log_info('try {runif(1)}')
## End(Not run)



