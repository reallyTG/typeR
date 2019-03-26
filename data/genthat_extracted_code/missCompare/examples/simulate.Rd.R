library(missCompare)


### Name: simulate
### Title: Simulation of matrix with no missingness
### Aliases: simulate

### ** Examples

cleaned <- clean(clindata_miss, missingness_coding = -9)
metadata <- get_data(cleaned)
simulated <- simulate(rownum = metadata$Rows, colnum = metadata$Columns,
cormat = metadata$Corr_matrix)




