library(ngstk)


### Name: fusions2pp_meta
### Title: Function to convert fusion data to ProteinPaint heatmap meta
###   rows <URL: https://pecan.stjude.org/pp> input format.
### Aliases: fusions2pp_meta

### ** Examples

demo_file <- system.file('extdata', 
'demo/proteinpaint/fusions2pp_fusioncatcher.txt', package = 'ngstk')
input_data <- read.table(demo_file, sep = '\t', header = TRUE, stringsAsFactors = FALSE)
disease <- 'B-ALL'
sampletype <- 'diagnose'
input_data <- data.frame(input_data, disease, sampletype)
input_data$disease <- as.character(input_data$disease)
#handler_data <- fusions2pp_meta(input_data, input_type = 'fusioncatcher')



