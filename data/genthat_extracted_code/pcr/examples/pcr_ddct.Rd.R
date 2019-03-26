library(pcr)


### Name: pcr_ddct
### Title: Calculate the delta_delta_ct model
### Aliases: pcr_ddct

### ** Examples

## locate and read raw ct data
fl <- system.file('extdata', 'ct1.csv', package = 'pcr')
ct1 <- readr::read_csv(fl)

# add grouping variable
group_var <- rep(c('brain', 'kidney'), each = 6)

# calculate all values and errors in one step
pcr_ddct(ct1,
         group_var = group_var,
         reference_gene = 'GAPDH',
         reference_group = 'brain')

# return a plot
pcr_ddct(ct1,
         group_var = group_var,
         reference_gene = 'GAPDH',
         reference_group = 'brain',
         plot = TRUE)




