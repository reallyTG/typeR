library(quanteda)


### Name: quanteda_options
### Title: Get or set package options for quanteda
### Aliases: quanteda_options

### ** Examples

(opt <- quanteda_options())
## No test: 
quanteda_options(verbose = TRUE)
quanteda_options("verbose" = FALSE)
quanteda_options("threads")
quanteda_options(print_dfm_max_ndoc = 50L)
# reset to defaults
quanteda_options(reset = TRUE)
# reset to saved options
quanteda_options(opt)
## End(No test)



