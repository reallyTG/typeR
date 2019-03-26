library(ngstk)


### Name: muts2pp
### Title: Function to convert mutation data to ProteinPaint <URL:
###   https://pecan.stjude.org/pp> input format.
### Aliases: muts2pp

### ** Examples

demo_file <- system.file('extdata', 
'demo/proteinpaint/muts2pp_iseq.txt', package = 'ngstk')
input_data <- read.table(demo_file, sep = '\t', header = TRUE, stringsAsFactors = FALSE)
disease <- 'T-ALL'
input_data <- data.frame(input_data, disease)
input_data$disease <- as.character(input_data$disease)
muts2pp(input_data, input_type = 'iseq')



