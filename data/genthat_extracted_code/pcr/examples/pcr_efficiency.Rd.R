library(pcr)


### Name: pcr_efficiency
### Title: Calculate amplification efficiency
### Aliases: pcr_efficiency

### ** Examples

# locate and read file
fl <- system.file('extdata', 'ct3.csv', package = 'pcr')
ct3 <- readr::read_csv(fl)

# make amount/dilution variable
amount <- rep(c(1, .5, .2, .1, .05, .02, .01), each = 3)

# calculate amplification efficiency
pcr_efficiency(ct3,
               amount = amount,
               reference_gene = 'GAPDH')

# plot amplification efficiency
pcr_efficiency(ct3,
               amount = amount,
               reference_gene = 'GAPDH',
               plot = TRUE)




