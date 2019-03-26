library(dlookr)


### Name: normality
### Title: Performs the Shapiro-Wilk test of normality
### Aliases: normality normality.data.frame

### ** Examples

## No test: 
# Generate data for the example
carseats <- ISLR::Carseats
carseats[sample(seq(NROW(carseats)), 20), "Income"] <- NA
carseats[sample(seq(NROW(carseats)), 5), "Urban"] <- NA

# Normality test of numerical variables
normality(carseats)

# Select the variable to describe
normality(carseats, Sales, Price)
normality(carseats, -Sales, -Price)
normality(carseats, 1)
normality(carseats, Sales, Price, sample = 300)

# Using dplyr::grouped_dt
library(dplyr)

gdata <- group_by(carseats, ShelveLoc, US)
normality(gdata, "Sales")
normality(gdata, sample = 250)

# Using pipes ---------------------------------
# Normality test of all numerical variables
carseats %>%
 normality()

# Positive values select variables
carseats %>%
 normality(Sales, Price)

# Positions values select variables
carseats %>%
 normality(1)

# Using pipes & dplyr -------------------------
# Test all numerical variables by 'ShelveLoc' and 'US',
# and extract only those with 'ShelveLoc' variable level is "Good".
carseats %>%
 group_by(ShelveLoc, US) %>%
 normality() %>%
 filter(ShelveLoc == "Good")

# extract only those with 'Urban' variable level is "Yes",
# and test 'Sales' by 'ShelveLoc' and 'US'
carseats %>%
 filter(Urban == "Yes") %>%
 group_by(ShelveLoc, US) %>%
 normality(Sales)

# Test log(Income) variables by 'ShelveLoc' and 'US',
# and extract only p.value greater than 0.01.
carseats %>%
 mutate(log_income = log(Income)) %>%
 group_by(ShelveLoc, US) %>%
 normality(log_income) %>%
 filter(p_value > 0.01)
## End(No test)




