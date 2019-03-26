library(pcr)


### Name: pcr_wilcox
### Title: Wilcoxon test qPCR data
### Aliases: pcr_wilcox

### ** Examples

# locate and read data
fl <- system.file('extdata', 'ct4.csv', package = 'pcr')
ct4 <- readr::read_csv(fl)

# make group variable
group <- rep(c('control', 'treatment'), each = 12)

# test
pcr_wilcox(ct4,
           group_var = group,
           reference_gene = 'ref',
           reference_group = 'control')

# test using wilcox.test method
pcr_test(ct4,
         group_var = group,
         reference_gene = 'ref',
         reference_group = 'control',
         test = 'wilcox.test')




