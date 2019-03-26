library(pcr)


### Name: pcr_analyze
### Title: Apply qPCR analysis methods
### Aliases: pcr_analyze

### ** Examples

# applying the delta delta ct method
## locate and read raw ct data
fl <- system.file('extdata', 'ct1.csv', package = 'pcr')
ct1 <- readr::read_csv(fl)

# add grouping variable
group_var <- rep(c('brain', 'kidney'), each = 6)

# calculate all values and errors in one step
pcr_analyze(ct1,
            group_var = group_var,
            reference_gene = 'GAPDH',
            reference_group = 'brain',
            method = 'delta_delta_ct')

# return a plot
pcr_analyze(ct1,
            group_var = group_var,
            reference_gene = 'GAPDH',
            reference_group = 'brain',
            method = 'delta_delta_ct',
            plot = TRUE)

# applying the delta ct method
# make a data.frame of two identical columns
pcr_hk <- data.frame(
  GAPDH1 = ct1$GAPDH,
  GAPDH2 = ct1$GAPDH
  )

# calculate fold change
pcr_analyze(pcr_hk,
            group_var = group_var,
            reference_group = 'brain',
            method = 'delta_ct')

# return a plot
pcr_analyze(pcr_hk,
            group_var = group_var,
            reference_group = 'brain',
            method = 'delta_ct',
            plot = TRUE)

# applying the standard curve method
# locate and read file
fl <- system.file('extdata', 'ct3.csv', package = 'pcr')
ct3 <- readr::read_csv(fl)

# make a vector of RNA amounts
amount <- rep(c(1, .5, .2, .1, .05, .02, .01), each = 3)

# calculate curve
standard_curve <- pcr_assess(ct3, amount = amount, method = 'standard_curve')
intercept <- standard_curve$intercept
slope <- standard_curve$slope

# apply the standard curve method
pcr_analyze(ct1,
           group_var = group_var,
           reference_gene = 'GAPDH',
           reference_group = 'brain',
           intercept = intercept,
           slope = slope,
           method = 'relative_curve')

# return a plot
pcr_analyze(ct1,
           group_var = group_var,
           reference_gene = 'GAPDH',
           reference_group = 'brain',
           intercept = intercept,
           slope = slope,
           method = 'relative_curve',
           plot = TRUE)




