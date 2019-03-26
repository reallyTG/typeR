library(plm)


### Name: lag
### Title: lag, lead, and diff for panel data
### Aliases: lag lead diff lag.pseries lead.pseries diff.pseries
### Keywords: classes

### ** Examples

# First, create a pdata.frame
data("EmplUK", package = "plm")
Em <- pdata.frame(EmplUK)

# Then extract a series, which becomes additionally a pseries
z <- Em$output
class(z)

# compute the first and third lag, and the difference lagged twice
lag(z)
lag(z, 3)
diff(z, 2)

# compute negative lags (= leading values)
lag(z, -1)
lead(z, 1) # same as line above
identical(lead(z, 1), lag(z, -1)) # TRUE
 
# compute more than one lag and diff at once
# (each returns matrix)
lag(z, c(1,2))
diff(z, c(1,2))



