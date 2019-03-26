library(dlookr)


### Name: correlate.tbl_dbi
### Title: Compute the correlation coefficient between two numerical data
### Aliases: correlate.tbl_dbi

### ** Examples

library(dplyr)
library(dbplyr)

# Generate data for the example
carseats <- ISLR::Carseats
carseats[sample(seq(NROW(carseats)), 20), "Income"] <- NA
carseats[sample(seq(NROW(carseats)), 5), "Urban"] <- NA

# connect DBMS
con_sqlite <- DBI::dbConnect(RSQLite::SQLite(), ":memory:")

# copy carseats to the DBMS with a table named TB_CARSEATS
copy_to(con_sqlite, carseats, name = "TB_CARSEATS", overwrite = TRUE)

# Using pipes ---------------------------------
# Correlation coefficients of all numerical variables
con_sqlite %>% 
  tbl("TB_CARSEATS") %>% 
  correlate()
 
# Positive values select variables
con_sqlite %>% 
  tbl("TB_CARSEATS") %>% 
  correlate(Sales, Price)
 
# Negative values to drop variables, and In-memory mode and collect size is 200
con_sqlite %>% 
  tbl("TB_CARSEATS") %>% 
  correlate(-Sales, -Price, collect_size = 200)
 
# Positions values select variables
con_sqlite %>% 
  tbl("TB_CARSEATS") %>% 
  correlate(1)
 
# Positions values select variables
con_sqlite %>% 
  tbl("TB_CARSEATS") %>% 
  correlate(-1, -2, -3, -5, -6)
 
# ---------------------------------------------
# Correlation coefficient
# that eliminates redundant combination of variables
con_sqlite %>% 
  tbl("TB_CARSEATS") %>% 
  correlate() %>%
  filter(as.integer(var1) > as.integer(var2))

con_sqlite %>% 
  tbl("TB_CARSEATS") %>% 
  correlate(Sales, Price) %>%
  filter(as.integer(var1) > as.integer(var2))

# Using pipes & dplyr -------------------------
# Compute the correlation coefficient of Sales variable by 'ShelveLoc'
# and 'US' variables. And extract only those with absolute
# value of correlation coefficient is greater than 0.5
con_sqlite %>% 
  tbl("TB_CARSEATS") %>% 
  group_by(ShelveLoc, US) %>%
  correlate(Sales) %>%
  filter(abs(coef_corr) >= 0.5)

# extract only those with 'ShelveLoc' variable level is "Good",
# and compute the correlation coefficient of 'Sales' variable
# by 'Urban' and 'US' variables.
# And the correlation coefficient is negative and smaller than 0.5
con_sqlite %>% 
  tbl("TB_CARSEATS") %>% 
  filter(ShelveLoc == "Good") %>%
  group_by(Urban, US) %>%
  correlate(Sales) %>%
  filter(coef_corr < 0) %>%
  filter(abs(coef_corr) > 0.5)
 



