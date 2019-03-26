library(ngstk)


### Name: fusions2pp
### Title: Function to convert fusion data to ProteinPaint <URL:
###   https://pecan.stjude.org/pp> input format.
### Aliases: fusions2pp

### ** Examples

demo_file <- system.file('extdata', 
'demo/proteinpaint/fusions2pp_fusioncatcher.txt', package = 'ngstk')
input_data <- read.table(demo_file, sep = '\t', header = TRUE, stringsAsFactors = FALSE)
disease <- 'B-ALL'
sampletype <- 'diagnose'
input_data <- data.frame(input_data, disease, sampletype)
input_data$disease <- as.character(input_data$disease)
handler_data <- fusions2pp(input_data, input_type = 'fusioncatcher')



