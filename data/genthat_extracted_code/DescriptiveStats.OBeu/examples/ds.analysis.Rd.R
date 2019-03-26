library(DescriptiveStats.OBeu)


### Name: ds.analysis
### Title: Calculation of some Descriptive Tasks
### Aliases: ds.analysis

### ** Examples

# with data frame as input with the default parameters
data <- iris
ds.analysis(data)

# using the previous data frame with different parameters
ds.analysis(data, c.out = 1, box.width = 0.20, outliers = TRUE, tojson = TRUE)

# using the previous data frame with different parameters 
# fr.select parameter specified as Species
ds.analysis(data, c.out = 1, outliers = FALSE, fr.select = "Species", tojson = TRUE)

# OpenBudgets.eu Dataset Example:
df = Wuppertal_df
ds.analysis(df, c.out = 2, box.width = 0.15, outliers = FALSE, tojson = FALSE)
                



