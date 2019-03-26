library(dlookr)


### Name: plot_normality.tbl_dbi
### Title: Plot distribution information of numerical data
### Aliases: plot_normality.tbl_dbi

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
# Visualization of all numerical variables
con_sqlite %>% 
  tbl("TB_CARSEATS") %>% 
  plot_normality()

# Positive values select variables, and In-memory mode and collect size is 200
con_sqlite %>% 
  tbl("TB_CARSEATS") %>% 
  plot_normality(Income, Price, collect_size = 200)

# Positions values select variables
con_sqlite %>% 
  tbl("TB_CARSEATS") %>% 
  plot_normality(1)

# Using pipes & dplyr -------------------------
# Plot 'Sales' variable by 'ShelveLoc' and 'US'
con_sqlite %>% 
  tbl("TB_CARSEATS") %>% 
  group_by(ShelveLoc, US) %>%
  plot_normality(Sales)

# extract only those with 'ShelveLoc' variable level is "Good",
# and plot 'Income' by 'US'
con_sqlite %>% 
  tbl("TB_CARSEATS") %>% 
  filter(ShelveLoc == "Good") %>%
  group_by(US) %>%
  plot_normality(Income)
## End(No test)




