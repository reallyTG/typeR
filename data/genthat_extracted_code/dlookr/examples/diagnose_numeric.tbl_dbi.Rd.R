library(dlookr)


### Name: diagnose_numeric.tbl_dbi
### Title: Diagnose data quality of numerical variables in the DBMS
### Aliases: diagnose_numeric.tbl_dbi

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
# Diagnosis of all numerical variables
con_sqlite %>% 
  tbl("TB_CARSEATS") %>% 
  diagnose_numeric()
  
# Positive values select variables, and In-memory mode and collect size is 200
con_sqlite %>% 
  tbl("TB_CARSEATS") %>% 
  diagnose_numeric(Sales, Income, collect_size = 200)
  
# Negative values to drop variables
con_sqlite %>% 
  tbl("TB_CARSEATS") %>% 
  diagnose_numeric(-Sales, -Income)
  
# Positions values select variables
con_sqlite %>% 
  tbl("TB_CARSEATS") %>% 
  diagnose_numeric(5)
  
# Positions values select variables
con_sqlite %>% 
  tbl("TB_CARSEATS") %>% 
  diagnose_numeric(-1, -5)

# Using pipes & dplyr -------------------------
# Information records of zero variable more than 0
con_sqlite %>% 
  tbl("TB_CARSEATS") %>% 
  diagnose_numeric()  %>%
  filter(zero > 0)
  



