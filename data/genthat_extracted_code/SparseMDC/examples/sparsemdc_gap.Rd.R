library(SparseMDC)


### Name: sparsemdc_gap
### Title: Gap Statistic Calculator
### Aliases: sparsemdc_gap

### ** Examples

set.seed(10)
# Select small dataset for example
data_test <- data_biase[1:100,]
# Split data into condition A and B
data_A <- data_test[ , which(condition_biase == "A")]
data_B <- data_test[ , which(condition_biase == "B")]
data_C <- data_test[ , which(condition_biase == "C")]
# Store data as list
dat_l <- list(data_A, data_B, data_C)
# Pre-process the data
pdat <- pre_proc_data(dat_l, dim=3, norm = FALSE, log = TRUE,
center = TRUE)
# Run with one bootstrap sample for example
gap_stat <- sparsemdc_gap(pdat, dim=3, min_clus = 2, max_clus =3, nboots =2,
nitter = 2, nstarts = 1, l1_boot = 5, l2_boot = 5)




