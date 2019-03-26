library(popEpi)


### Name: robust_values
### Title: Convert values to numeric robustly
### Aliases: robust_values

### ** Examples

## this works
values <- c("1", "3", "5")
values <- robust_values(values)

## this works
values <- c("1", "3", "5", NA)
values <- robust_values(values)

## this returns originals
values <- c("1", "3", "5", "a")
values <- robust_values(values)

## this forces "a" to NA and works otherwise
values <- c("1", "3", "5", "a")
values <- robust_values(values, force=TRUE)




