library(dbplyr)


### Name: sql_variant
### Title: Create an sql translator
### Aliases: sql_variant sql_translator sql_infix sql_prefix sql_aggregate
###   sql_aggregate_2 sql_not_supported sql_cast sql_log sql_cot
###   base_scalar base_agg base_win base_no_win base_odbc_scalar
###   base_odbc_agg base_odbc_win sql_paste sql_paste_infix
### Keywords: datasets internal

### ** Examples

# An example of adding some mappings for the statistical functions that
# postgresql provides: http://bit.ly/K5EdTn

postgres_agg <- sql_translator(.parent = base_agg,
  cor = sql_aggregate_2("corr"),
  cov = sql_aggregate_2("covar_samp"),
  sd =  sql_aggregate("stddev_samp"),
  var = sql_aggregate("var_samp")
)
postgres_var <- sql_variant(
  base_scalar,
  postgres_agg,
  base_no_win
)

# Next we have to simulate a connection that uses this variant
con <- structure(
  list(),
  class = c("TestCon", "DBITestConnection", "DBIConnection")
)
sql_translate_env.TestCon <- function(x) postgres_var

translate_sql(cor(x, y), con = con, window = FALSE)
translate_sql(sd(income / years), con = con, window = FALSE)

# Any functions not explicitly listed in the converter will be translated
# to sql as is, so you don't need to convert all functions.
translate_sql(regr_intercept(y, x), con = con)



