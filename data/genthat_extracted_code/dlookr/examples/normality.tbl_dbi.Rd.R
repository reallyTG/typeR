library(dlookr)


### Name: normality.tbl_dbi
### Title: Performs the Shapiro-Wilk test of normality
### Aliases: normality.tbl_dbi

### ** Examples

## No test: 
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
# Normality test of all numerical variables
con_sqlite %>% 
  tbl("TB_CARSEATS") %>% 
 normality()

# Positive values select variables, and In-memory mode and collect size is 200
con_sqlite %>% 
  tbl("TB_CARSEATS") %>% 
 normality(Sales, Price, collect_size  = 200)

# Positions values select variables
con_sqlite %>% 
  tbl("TB_CARSEATS") %>% 
 normality(1)

# Using pipes & dplyr -------------------------
# Test all numerical variables by 'ShelveLoc' and 'US',
# and extract only those with 'ShelveLoc' variable level is "Good".
con_sqlite %>% 
  tbl("TB_CARSEATS") %>% 
 group_by(ShelveLoc, US) %>%
 normality() %>%
 filter(ShelveLoc == "Good")

# extract only those with 'Urban' variable level is "Yes",
# and test 'Sales' by 'ShelveLoc' and 'US'
con_sqlite %>% 
  tbl("TB_CARSEATS") %>% 
 filter(Urban == "Yes") %>%
 group_by(ShelveLoc, US) %>%
 normality(Sales)

# Test log(Income) variables by 'ShelveLoc' and 'US',
# and extract only p.value greater than 0.01.

# SQLite extension functions for log
RSQLite::initExtension(con_sqlite)

con_sqlite %>% 
  tbl("TB_CARSEATS") %>% 
 mutate(log_income = log(Income)) %>%
 group_by(ShelveLoc, US) %>%
 normality(log_income) %>%
 filter(p_value > 0.01)
## End(No test)




