library(dlookr)


### Name: diagnose.tbl_dbi
### Title: Diagnose data quality of variables in the DBMS
### Aliases: diagnose.tbl_dbi

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
# Diagnosis of all columns
con_sqlite %>% 
  tbl("TB_CARSEATS") %>% 
  diagnose()
  
# Positive values select columns
con_sqlite %>% 
  tbl("TB_CARSEATS") %>% 
  diagnose(Sales, Income, Age)
  
# Negative values to drop columns
con_sqlite %>% 
  tbl("TB_CARSEATS") %>% 
  diagnose(-Sales, -Income, -Age)
  
# Positions values select columns, and In-memory mode
con_sqlite %>% 
  tbl("TB_CARSEATS") %>% 
  diagnose(1, 3, 8, in_database = FALSE)
  
# Positions values select columns, and In-memory mode and collect size is 200
con_sqlite %>% 
  tbl("TB_CARSEATS") %>% 
  diagnose(-8, -9, -10, in_database = FALSE, collect_size = 200)

# Using pipes & dplyr -------------------------
# Diagnosis of missing variables
con_sqlite %>% 
  tbl("TB_CARSEATS") %>% 
  diagnose() %>%
  filter(missing_count > 0)
  



