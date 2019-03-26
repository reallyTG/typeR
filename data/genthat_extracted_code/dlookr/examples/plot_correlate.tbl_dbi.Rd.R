library(dlookr)


### Name: plot_correlate.tbl_dbi
### Title: Visualize correlation plot of numerical data
### Aliases: plot_correlate.tbl_dbi

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
# Visualize correlation plot of all numerical variables
con_sqlite %>% 
  tbl("TB_CARSEATS") %>% 
  plot_correlate()
  
# Positive values select variables, and In-memory mode and collect size is 200
con_sqlite %>% 
  tbl("TB_CARSEATS") %>% 
  plot_correlate(Sales, Price, collect_size = 200)
  
# Negative values to drop variables
con_sqlite %>% 
  tbl("TB_CARSEATS") %>% 
  plot_correlate(-Sales, -Price)
  
# Positions values select variables
con_sqlite %>% 
  tbl("TB_CARSEATS") %>% 
  plot_correlate(1)
  
# Positions values select variables
con_sqlite %>% 
  tbl("TB_CARSEATS") %>% 
  plot_correlate(-1, -2, -3, -5, -6)

# Using pipes & dplyr -------------------------
# Visualize correlation plot of 'Sales' variable by 'ShelveLoc'
# and 'US' variables.
con_sqlite %>% 
  tbl("TB_CARSEATS") %>% 
  group_by(ShelveLoc, US) %>%
  plot_correlate(Sales)

# Extract only those with 'ShelveLoc' variable level is "Good",
# and visualize correlation plot of 'Sales' variable by 'Urban'
# and 'US' variables.
con_sqlite %>% 
  tbl("TB_CARSEATS") %>% 
  filter(ShelveLoc == "Good") %>%
  group_by(Urban, US) %>%
  plot_correlate(Sales)
 



