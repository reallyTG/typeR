library(pcr)


### Name: pcr_assess
### Title: Assess qPCR data quality
### Aliases: pcr_assess

### ** Examples

#' # locate and read file
fl <- system.file('extdata', 'ct3.csv', package = 'pcr')
ct3 <- readr::read_csv(fl)

# make amount/dilution variable
amount <- rep(c(1, .5, .2, .1, .05, .02, .01), each = 3)

# calculate the standard curve
pcr_assess(ct3,
           amount = amount,
           method = 'standard_curve')

# retrun a plot
pcr_assess(ct3,
           amount = amount,
           method = 'standard_curve',
           plot = TRUE)

# calculate amplification efficiency
pcr_assess(ct3,
           amount = amount,
           reference_gene = 'GAPDH',
           method = 'efficiency')

# return a plot
pcr_assess(ct3,
           amount = amount,
           reference_gene = 'GAPDH',
           method = 'efficiency',
           plot = TRUE)




