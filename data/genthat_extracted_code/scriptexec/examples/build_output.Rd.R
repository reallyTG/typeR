library(scriptexec)


### Name: build_output
### Title: Builds the output structure.
### Aliases: build_output

### ** Examples

output <- c('line 1', '\n', 'line 2')
attr(output, 'status') <- 15
script_output <- build_output(output)



