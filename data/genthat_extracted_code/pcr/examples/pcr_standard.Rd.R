library(pcr)


### Name: pcr_standard
### Title: Calculate the standard curve
### Aliases: pcr_standard

### ** Examples

# locate and read file
fl <- system.file('extdata', 'ct3.csv', package = 'pcr')
ct3 <- readr::read_csv(fl)

# make amount/dilution variable
amount <- rep(c(1, .5, .2, .1, .05, .02, .01), each = 3)

# calculate the standard curve
pcr_standard(ct3,
             amount = amount)

# plot the standard curve
pcr_standard(ct3,
             amount = amount,
             plot = TRUE)




