library(hablar)


### Name: s
### Title: Make vector shorter and simpler
### Aliases: s

### ** Examples

## s on a weird numeric vector
vector <- c(7, NaN, 6, -Inf, 5, 4, NA)
s(vector)

## Sum vector with non-rational values
vector <- c(7, NaN, -Inf, 4)
# Base R
sum(vector)
# With s
sum(s(vector))

## Max of vector with only NA
# Base R
max(vector, na.rm = TRUE)
# With s
max(s(vector))

## First of vector when NA is first element
vector <- c(NA, "X", "Y")
# dplyr R
dplyr::first(vector)
# With s
dplyr::first(s(vector))

## Use of s when NA should not be removes
vector <- c(7, Inf, NA, 4)
# Base R
sum(vector)
# With s
sum(s(vector, ignore_na = FALSE))

## s when summarizing a weird data.frame
df_test <- data.frame(a = c(NaN, 1, -Inf, 3), 
                      b = c(NA, "Q", "P", "P"), 
                      c = c(NA, NA, NA, NA), 
                      stringsAsFactors = FALSE) 
df_test
# Base R aggregation with dplyr's summarize
dplyr::summarise(df_test, mean_a = mean(a), 
                          min_c = min(c, na.rm = TRUE))
# With s
dplyr::summarise(df_test, mean_a = mean(s(a)), 
                          min_c = min(s(c)))




