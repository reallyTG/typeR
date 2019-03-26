library(ngstk)


### Name: fusions_filter
### Title: Fusions handler_data filter that can be used to prepare the
###   input data for downstream analysis
### Aliases: fusions_filter

### ** Examples

demo_file <- system.file('extdata', 
'demo/proteinpaint/fusions2pp_fusioncatcher.txt', package = 'ngstk')
input_data <- read.table(demo_file, sep = '\t', header = TRUE, stringsAsFactors = FALSE)
result <- fusions_filter(input_data)



