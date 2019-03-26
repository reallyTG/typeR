library(dendroTools)


### Name: years_to_rownames
### Title: Function returns a data frame with row names as years
### Aliases: years_to_rownames

### ** Examples

data <- data.frame(years = seq(1950, 2015), observations = rnorm(66))
new_data <- years_to_rownames(data = data, column_year = "years")

data <- data.frame(observations1 = rnorm(66), years = seq(1950, 2015),
observations2 = rnorm(66), observations3 = rnorm(66))
new_data <- years_to_rownames(data = data, column_year = "years")



