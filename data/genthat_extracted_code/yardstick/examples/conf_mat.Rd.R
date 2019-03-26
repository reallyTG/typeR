library(yardstick)


### Name: conf_mat
### Title: Confusion Matrix for Categorical Data
### Aliases: conf_mat conf_mat.table conf_mat.default conf_mat.data.frame
###   tidy.conf_mat

### ** Examples

library(dplyr)
data("hpc_cv")

# The confusion matrix from a single assessment set (i.e. fold)
hpc_cv %>%
  filter(Resample == "Fold01") %>%
  conf_mat(obs, pred)

# Now compute the average confusion matrix across all folds in
# terms of the proportion of the data contained in each cell.
# First get the raw cell counts per fold using the `tidy` method
library(purrr)
library(tidyr)

cells_per_resample <- hpc_cv %>%
  group_by(Resample) %>%
  conf_mat(obs, pred) %>%
  mutate(tidied = map(conf_mat, tidy)) %>%
  unnest(tidied)

# Get the totals per resample
counts_per_resample <- hpc_cv %>%
  group_by(Resample) %>%
  summarize(total = n()) %>%
  left_join(cells_per_resample, by = "Resample") %>%
  # Compute the proportions
  mutate(prop = value/total) %>%
  group_by(name) %>%
  # Average
  summarize(prop = mean(prop))

counts_per_resample

# Now reshape these into a matrix
mean_cmat <- matrix(counts_per_resample$prop, byrow = TRUE, ncol = 4)
rownames(mean_cmat) <- levels(hpc_cv$obs)
colnames(mean_cmat) <- levels(hpc_cv$obs)

round(mean_cmat, 3)



