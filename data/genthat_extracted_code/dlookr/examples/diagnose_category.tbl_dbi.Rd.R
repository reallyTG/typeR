library(dlookr)


### Name: diagnose_category.tbl_dbi
### Title: Diagnose data quality of categorical variables in the DBMS
### Aliases: diagnose_category.tbl_dbi

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
# Diagnosis of all categorical variables
con_sqlite %>% 
  tbl("TB_CARSEATS") %>% 
  diagnose_category()
  
# Positive values select variables
con_sqlite %>% 
  tbl("TB_CARSEATS") %>% 
  diagnose_category(Urban, US)
  
# Negative values to drop variables, and In-memory mode
con_sqlite %>% 
  tbl("TB_CARSEATS") %>% 
  diagnose_category(-Urban, -US, in_database = FALSE)
  
# Positions values select variables, and In-memory mode and collect size is 200
con_sqlite %>% 
  tbl("TB_CARSEATS") %>% 
  diagnose_category(7, in_database = FALSE, collect_size = 200) 
  
# Positions values select variables
con_sqlite %>% 
  tbl("TB_CARSEATS") %>% 
  diagnose_category(-7)
  
# Top rank levels with top argument
con_sqlite %>% 
  tbl("TB_CARSEATS") %>% 
  diagnose_category(top = 2)

# Using pipes & dplyr -------------------------
# Extraction of level that is more than 60% of categorical data
con_sqlite %>% 
  tbl("TB_CARSEATS") %>% 
  diagnose_category()  %>%
  filter(ratio >= 60)
  



