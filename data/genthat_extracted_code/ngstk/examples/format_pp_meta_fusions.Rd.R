library(ngstk)


### Name: format_pp_meta_fusions
### Title: To format ProteinPaint input meta data of gender
### Aliases: format_pp_meta_fusions

### ** Examples


meta_template <- system.file('extdata', 
'demo/proteinpaint/heatmap_meta_template.txt', package = 'ngstk')
raw_meta <- read.table(meta_template, sep = '\t', header = TRUE)
meta_test_1 <- raw_meta
term <- group <- 'Fusions'
meta_test_1$term <- term
meta_test_1$group <- group
meta_test_1$value <- c(rep(c('ZNF384-Fusions', 'MEF2D-Fusions'), 
3), 'TCF3-PBX1')
meta_fusions <- format_pp_meta_fusions(meta_test_1)
meta_test_2 <- raw_meta
term <- group <- c(rep(c('MEF2D-Fusions', 'ZNF384-Fusions'), 
3), 'DUX4-Fusions')
meta_test_2$term <- term
meta_test_2$group <- group
meta_test_2$value <- c('MEF2D-PA', 'EP300-ZNF384', 
'MEF2D-PB', 'ABC-ZNF384', 'MEF2D-PB', 'ABD-ZNF384', 
                       'DUX4-IGH')
meta_fusions <- format_pp_meta_fusions(meta_test_2)



