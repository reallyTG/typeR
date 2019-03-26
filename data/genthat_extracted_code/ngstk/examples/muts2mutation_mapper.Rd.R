library(ngstk)


### Name: muts2mutation_mapper
### Title: Function to convert mutation data to MutationMapper <URL:
###   http://www.cbioportal.org/mutation_mapper.jsp> input format.
### Aliases: muts2mutation_mapper

### ** Examples

demo_file <- system.file('extdata', 
'demo/proteinpaint/muts2pp_iseq.txt', package = 'ngstk')
input_data <- read.table(demo_file, sep = '\t', header = TRUE, stringsAsFactors = FALSE)
disease <- 'T-ALL'
input_data <- data.frame(input_data, disease)
input_data$disease <- as.character(input_data$disease)
muts2mutation_mapper(input_data, input_type = 'iseq')



