library(pcr)


### Name: pcr_dct
### Title: Calculate the delta_ct model
### Aliases: pcr_dct

### ** Examples

# locate and read file
fl <- system.file('extdata', 'ct1.csv', package = 'pcr')
ct1 <- readr::read_csv(fl)

# make a data.frame of two identical columns
pcr_hk <- data.frame(
  GAPDH1 = ct1$GAPDH,
  GAPDH2 = ct1$GAPDH
  )

# add grouping variable
group_var <- rep(c('brain', 'kidney'), each = 6)

# calculate caliberation
pcr_dct(pcr_hk,
        group_var = group_var,
        reference_group = 'brain')

# returns a plot
pcr_dct(pcr_hk,
        group_var = group_var,
        reference_group = 'brain',
        plot = TRUE)

# returns a plot with facets
pcr_dct(pcr_hk,
        group_var = group_var,
        reference_group = 'brain',
        plot = TRUE,
        facet = TRUE)




