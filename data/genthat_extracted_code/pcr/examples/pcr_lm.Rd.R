library(pcr)


### Name: pcr_lm
### Title: Linear regression qPCR data
### Aliases: pcr_lm

### ** Examples

# locate and read data
fl <- system.file('extdata', 'ct4.csv', package = 'pcr')
ct4 <- readr::read_csv(fl)

# make group variable
group <- rep(c('control', 'treatment'), each = 12)

# test
pcr_lm(ct4,
       group_var = group,
       reference_gene = 'ref',
       reference_group = 'control')

# testing using lm method
pcr_test(ct4,
         group_var = group,
         reference_gene = 'ref',
         reference_group = 'control',
         test = 'lm')




