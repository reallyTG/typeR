library(dataPreparation)


### Name: fastFilterVariables
### Title: Filtering useless variables
### Aliases: fastFilterVariables

### ** Examples

# First let's build a data.frame with 3 columns: a constant column, and a column in double
df <- data.frame(col1 = 1, col2 = rnorm(1e6), col3 = sample(c(1, 2), 1e6, replace = TRUE))
df$col4 <- df$col2
df$col5[df$col3 == 1] = "a"
df$col5[df$col3 == 2] = "b" # Same info than in col1 but with a for 1 and b for 2
head(df)

# Let's filter columns:
df <- fastFilterVariables(df)
head(df)



