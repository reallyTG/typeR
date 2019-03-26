library(dbplyr)


### Name: simulate_dbi
### Title: Create a local lazy tibble
### Aliases: simulate_dbi simulate_sqlite simulate_postgres simulate_mysql
###   simulate_odbc simulate_impala simulate_mssql simulate_oracle
###   simulate_hive simulate_odbc_postgresql simulate_teradata
###   simulate_odbc_access tbl_lazy lazy_frame
### Keywords: internal

### ** Examples

library(dplyr)
df <- data.frame(x = 1, y = 2)

df_sqlite <- tbl_lazy(df, src = simulate_sqlite())
df_sqlite %>% summarise(x = sd(x)) %>% show_query()



