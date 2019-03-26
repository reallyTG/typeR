library(dlookr)


### Name: plot_outlier.tbl_dbi
### Title: Plot outlier information of numerical data diagnosis in the DBMS
### Aliases: plot_outlier.tbl_dbi

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
# Visualization of all numerical variables
con_sqlite %>% 
  tbl("TB_CARSEATS") %>% 
  plot_outlier()
  
# Positive values select variables
con_sqlite %>% 
  tbl("TB_CARSEATS") %>% 
  plot_outlier(Sales, Price)
  
# Negative values to drop variables, and In-memory mode and collect size is 200
con_sqlite %>% 
  tbl("TB_CARSEATS") %>% 
  plot_outlier(-Sales, -Price, collect_size = 200)
  
# Positions values select variables
con_sqlite %>% 
  tbl("TB_CARSEATS") %>% 
  plot_outlier(6)
  
# Positions values select variables
carseats %>%
  plot_outlier(-1, -5)

# Using pipes & dplyr -------------------------
# Visualization of numerical variables with a ratio of
# outliers greater than 1%
con_sqlite %>% 
  tbl("TB_CARSEATS") %>% 
  plot_outlier(con_sqlite %>% 
                 tbl("TB_CARSEATS") %>% 
                 diagnose_outlier() %>%
                 filter(outliers_ratio > 1) %>%
                 select(variables) %>%
                 pull())
      



