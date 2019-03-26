library(ngstk)


### Name: fusions2oncoprinter
### Title: Function to convert mutation data to Oncoprinter <URL:
###   http://www.cbioportal.org/oncoprinter.jsp> input format.
### Aliases: fusions2oncoprinter

### ** Examples

demo_file <- system.file('extdata', 
'demo/proteinpaint/muts2pp_iseq.txt', package = 'ngstk')
input_data <- read.table(demo_file, sep = '\t', header = TRUE, stringsAsFactors = FALSE)
disease <- 'T-ALL'
input_data <- data.frame(input_data, disease)
input_data$disease <- as.character(input_data$disease)
fusions2oncoprinter(input_data, input_type = 'fusioncatcher')



