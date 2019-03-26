library(pcr)


### Name: pcr_curve
### Title: Calculate the standard curve model
### Aliases: pcr_curve

### ** Examples

# locate and read file
fl <- system.file('extdata', 'ct3.csv', package = 'pcr')
ct3 <- readr::read_csv(fl)

fl <- system.file('extdata', 'ct1.csv', package = 'pcr')
ct1 <- readr::read_csv(fl)

# make a vector of RNA amounts
amount <- rep(c(1, .5, .2, .1, .05, .02, .01), each = 3)

# calculate curve
standard_curve <- pcr_assess(ct3, amount = amount, method = 'standard_curve')
intercept <- standard_curve$intercept
slope <- standard_curve$slope

# make grouping variable
group <- rep(c('brain', 'kidney'), each = 6)

# apply the standard curve method
pcr_curve(ct1,
          group_var = group,
          reference_gene = 'GAPDH',
          reference_group = 'brain',
          intercept = intercept,
          slope = slope)

# returns a plot
pcr_curve(ct1,
          group_var = group,
          reference_gene = 'GAPDH',
          reference_group = 'brain',
          intercept = intercept,
          slope = slope,
          plot = TRUE)




