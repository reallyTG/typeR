library(SparseDC)


### Name: sparsedc_gap
### Title: Gap Statistic Calculator
### Aliases: sparsedc_gap

### ** Examples

# load a small dataset
data_test <- data_biase[1:50,]
# Split data into conditions 1 and 2
data_1 <- data_test[ , which(condition_biase == "A")]
data_2 <- data_test[ , which(condition_biase == "B")]
# Preprocess data (log transform and center)
pre_data <- pre_proc_data(data_1, data_2, norm = FALSE, log = TRUE,
center = TRUE)
# Run with one bootstrap sample for example
gap_stat <- sparsedc_gap(pre_data[[1]], pre_data[[2]],
 min_clus <- 2, max_clus <- 3, nboots <- 2)





