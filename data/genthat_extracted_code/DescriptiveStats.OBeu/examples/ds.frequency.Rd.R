library(DescriptiveStats.OBeu)


### Name: ds.frequency
### Title: Barplot parameters
### Aliases: ds.frequency

### ** Examples

# with data frame as an input and a selected column to calculate its frequencies
ds.frequency(iris, select = "Species", tojson = FALSE)

# with data frame as an input without a selected column and json output
ds.frequency(iris, tojson = TRUE)

# OpenBudgets.eu Dataset Example:
head(Wuppertal_df)
ds.frequency(Wuppertal_df, select = "Produkt", tojson = FALSE)




