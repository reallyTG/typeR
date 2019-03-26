library(PKPDmisc)


### Name: unique_non_numerics
### Title: find all unique non-numeric values
### Aliases: unique_non_numerics

### ** Examples

dv <- c(1, 2, 4, "88 (excluded)", "bql", "*")
unique_non_numerics(dv)
df <- tibble::data_frame(ID = 1:3, DV = c("BQL", 0.5, 9))
unique_non_numerics(df$DV)

#using dplyr
library(dplyr)
df %>% filter(!(DV %in% unique_non_numerics(DV)))



