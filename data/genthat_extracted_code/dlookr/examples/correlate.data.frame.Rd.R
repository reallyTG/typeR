library(dlookr)


### Name: correlate
### Title: Compute the correlation coefficient between two numerical data
### Aliases: correlate correlate.data.frame

### ** Examples

# Generate data for the example
carseats <- ISLR::Carseats
carseats[sample(seq(NROW(carseats)), 20), "Income"] <- NA
carseats[sample(seq(NROW(carseats)), 5), "Urban"] <- NA

# Correlation coefficients of all numerical variables
correlate(carseats)

# Select the variable to compute
correlate(carseats, Sales, Price)
correlate(carseats, -Sales, -Price)
correlate(carseats, "Sales", "Price")
correlate(carseats, 1)

# Using dplyr::grouped_dt
library(dplyr)

gdata <- group_by(carseats, ShelveLoc, US)
correlate(gdata, "Sales")
correlate(gdata)

# Using pipes ---------------------------------
# Correlation coefficients of all numerical variables
carseats %>%
 correlate()
# Positive values select variables
carseats %>%
 correlate(Sales, Price)
# Negative values to drop variables
carseats %>%
 correlate(-Sales, -Price)
# Positions values select variables
carseats %>%
 correlate(1)
# Positions values select variables
carseats %>%
 correlate(-1, -2, -3, -5, -6)
# ---------------------------------------------
# Correlation coefficient
# that eliminates redundant combination of variables
carseats %>%
 correlate() %>%
 filter(as.integer(var1) > as.integer(var2))

carseats %>%
 correlate(Sales, Price) %>%
 filter(as.integer(var1) > as.integer(var2))

# Using pipes & dplyr -------------------------
# Compute the correlation coefficient of Sales variable by 'ShelveLoc'
# and 'US' variables. And extract only those with absolute
# value of correlation coefficient is greater than 0.5
carseats %>%
 group_by(ShelveLoc, US) %>%
 correlate(Sales) %>%
 filter(abs(coef_corr) >= 0.5)

# extract only those with 'ShelveLoc' variable level is "Good",
# and compute the correlation coefficient of 'Sales' variable
# by 'Urban' and 'US' variables.
# And the correlation coefficient is negative and smaller than 0.5
carseats %>%
 filter(ShelveLoc == "Good") %>%
 group_by(Urban, US) %>%
 correlate(Sales) %>%
 filter(coef_corr < 0) %>%
 filter(abs(coef_corr) > 0.5)



