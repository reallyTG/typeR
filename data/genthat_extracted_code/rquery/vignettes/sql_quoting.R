## ------------------------------------------------------------------------
library("rquery")

date_cutoff <- '2017-04-02'

td <- mk_td("df", 
            c("cust",
              "trans_date",
              "sales"))

ops <- td %.>%
  select_rows_se(
    ., 
    qe(trans_date <=  str_to_date(.(date_cutoff), '%Y-%m-%d'))) %.>%
  sql_node(
    .,
    qae(max_date = max(.[trans_date]),
        const_col1 = "a'",
        const_col2 = 'a"'),
    mods = "GROUP BY .[cust]",
    orig_columns = FALSE)

cat(format(ops))

## ------------------------------------------------------------------------
db1 <- rquery_db_info(
  identifier_quote_char = "'",
  string_quote_char = '"')

cat(to_sql(ops, db1))

## ------------------------------------------------------------------------
db2 <- rquery_db_info(
  identifier_quote_char = '"',
  string_quote_char = "'")
  
cat(to_sql(ops, db2))

## ----strex---------------------------------------------------------------
ops <- td %.>%
  select_rows_se(
    ., 
    qe(trans_date <=  str_to_date(.(date_cutoff), '%Y-%m-%d'))) %.>%
  sql_node(
    .,
    list(
      "max_date" %:=% "max(.[trans_date])",
      "const_col1" = list(list("a'")),
      "const_col2" = list(list('b"'))),
    mods = "GROUP BY .[cust]",
    orig_columns = FALSE)

cat(format(ops))

cat(to_sql(ops, db1))

cat(to_sql(ops, db2))


