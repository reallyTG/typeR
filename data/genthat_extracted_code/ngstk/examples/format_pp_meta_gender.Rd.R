library(ngstk)


### Name: format_pp_meta_gender
### Title: To format ProteinPaint input meta data of gender
### Aliases: format_pp_meta_gender

### ** Examples

meta_template <- system.file('extdata', 
'demo/proteinpaint/heatmap_meta_template.txt', package = 'ngstk')
raw_meta <- read.table(meta_template, sep = '\t', header = TRUE)
term <- group <- 'Gender'
raw_meta$term <- term
raw_meta$group <- group
raw_meta$value <- c(rep(c('Male', 'Female'), 3), 'Male')
meta_gender <- format_pp_meta_gender(raw_meta)



