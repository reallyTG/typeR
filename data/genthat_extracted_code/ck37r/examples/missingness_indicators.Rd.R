library(ck37r)


### Name: missingness_indicators
### Title: Return matrix of missingness indicators for a dataframe or
###   matrix.
### Aliases: missingness_indicators

### ** Examples


# Load a test dataset.
data(PimaIndiansDiabetes2, package = "mlbench")

# Check for missing values.
colSums(is.na(PimaIndiansDiabetes2))

# Generate missingness indicators; skip outcome variable.
indicators = missingness_indicators(PimaIndiansDiabetes2, skip_vars = "diabetes")

# Check missingness.
colSums(indicators)




