library(plm)


### Name: pseries
### Title: panel series
### Aliases: pseries Between between Within Between.pseries between.pseries
###   Within.pseries summary.pseries print.summary.pseries
###   as.matrix.pseries
### Keywords: classes

### ** Examples

# First, create a pdata.frame
data("EmplUK", package = "plm")
Em <- pdata.frame(EmplUK)

# Then extract a series, which becomes additionally a pseries
z <- Em$output
class(z)

# obtain the matrix representation
as.matrix(z)

# compute the between and within transformations
between(z)
Within(z)

# Between replicates the values for each time observation
Between(z)

# between, Between, and Within transformations on other dimension
between(z, effect = "time")
Between(z, effect = "time")
Within(z, effect = "time")

# NA treatment for between, Between, and Within
z2 <- z
z2[length(z2)] <- NA # set last value to NA
between(z2, na.rm = TRUE) # non-NA value for last individual
Between(z2, na.rm = TRUE) # only the NA observation is lost
Within(z2, na.rm = TRUE)  # only the NA observation is lost

sum(is.na(Between(z2))) # 9 observations lost due to one NA value
sum(is.na(Between(z2, na.rm = TRUE))) # only the NA observation is lost
sum(is.na(Within(z2))) # 9 observations lost due to one NA value
sum(is.na(Within(z2, na.rm = TRUE))) # only the NA observation is lost



