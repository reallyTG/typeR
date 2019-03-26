library(missCompare)


### Name: MNAR
### Title: Missing data spike-in in MNAR pattern
### Aliases: MNAR

### ** Examples

cleaned <- clean(clindata_miss, missingness_coding = -9)
metadata <- get_data(cleaned)
simulated <- simulate(rownum = metadata$Rows, colnum = metadata$Columns,
cormat = metadata$Corr_matrix)

MNAR(simulated$Simulated_matrix,
    MD_pattern = metadata$MD_Pattern,
    NA_fraction = metadata$Fraction_missingness,
    min_PDM = 10)




