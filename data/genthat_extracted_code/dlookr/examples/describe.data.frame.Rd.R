library(dlookr)


### Name: describe
### Title: Compute descriptive statistic
### Aliases: describe describe.data.frame

### ** Examples

# Generate data for the example
carseats <- ISLR::Carseats
carseats[sample(seq(NROW(carseats)), 20), "Income"] <- NA
carseats[sample(seq(NROW(carseats)), 5), "Urban"] <- NA

# Describe descriptive statistics of numerical variables
describe(carseats)

# Select the variable to describe
describe(carseats, Sales, Price)
describe(carseats, -Sales, -Price)
describe(carseats, 5)

# Using dplyr::grouped_dt
library(dplyr)

gdata <- group_by(carseats, ShelveLoc, US)
describe(gdata, "Income")

# Using pipes ---------------------------------
# Positive values select variables
carseats %>%
 describe(Sales, CompPrice, Income)

# Negative values to drop variables
carseats %>%
 describe(-Sales, -CompPrice, -Income)

# Using pipes & dplyr -------------------------
# Find the statistic of all numerical variables by 'ShelveLoc' and 'US',
# and extract only those with 'ShelveLoc' variable level is "Good".
carseats %>%
 group_by(ShelveLoc, US) %>%
   describe() %>%
   filter(ShelveLoc == "Good")

# extract only those with 'Urban' variable level is "Yes",
# and find 'Sales' statistics by 'ShelveLoc' and 'US'
carseats %>%
 filter(Urban == "Yes") %>%
 group_by(ShelveLoc, US) %>%
 describe(Sales)



