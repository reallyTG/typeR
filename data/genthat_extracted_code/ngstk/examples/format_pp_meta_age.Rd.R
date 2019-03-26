library(ngstk)


### Name: format_pp_meta_age
### Title: To format ProteinPaint input meta data of age
### Aliases: format_pp_meta_age

### ** Examples


meta_template <- system.file('extdata', 
'demo/proteinpaint/heatmap_meta_template.txt', 
package = 'ngstk')
raw_meta <- read.table(meta_template, sep = '\t', header = TRUE)
term <- group <- 'Age'
raw_meta$term <- term
raw_meta$group <- group
raw_meta$value <- c(rep(c('Adult', 'Pediatric'), 3),  'Male')
meta_age <- format_pp_meta_age(raw_meta)



