library(glue)


### Name: glue_sql
### Title: Interpolate strings with SQL escaping
### Aliases: glue_sql glue_data_sql

### ** Examples

con <- DBI::dbConnect(RSQLite::SQLite(), ":memory:")
colnames(iris) <- gsub("[.]", "_", tolower(colnames(iris)))
DBI::dbWriteTable(con, "iris", iris)
var <- "sepal_width"
tbl <- "iris"
num <- 2
val <- "setosa"
glue_sql("
  SELECT {`var`}
  FROM {`tbl`}
  WHERE {`tbl`}.sepal_length > {num}
    AND {`tbl`}.species = {val}
  ", .con = con)

# If sepal_length is store on the database as a character explicitly convert
# the data to character to quote appropriately.
glue_sql("
  SELECT {`var`}
  FROM {`tbl`}
  WHERE {`tbl`}.sepal_length > {as.character(num)}
    AND {`tbl`}.species = {val}
  ", .con = con)


# `glue_sql()` can be used in conjuction with parameterized queries using
# `DBI::dbBind()` to provide protection for SQL Injection attacks
 sql <- glue_sql("
    SELECT {`var`}
    FROM {`tbl`}
    WHERE {`tbl`}.sepal_length > ?
  ", .con = con)
query <- DBI::dbSendQuery(con, sql)
DBI::dbBind(query, list(num))
DBI::dbFetch(query, n = 4)
DBI::dbClearResult(query)

# `glue_sql()` can be used to build up more complex queries with
# interchangeable sub queries. It returns `DBI::SQL()` objects which are
# properly protected from quoting.
sub_query <- glue_sql("
  SELECT *
  FROM {`tbl`}
  ", .con = con)

glue_sql("
  SELECT s.{`var`}
  FROM ({sub_query}) AS s
  ", .con = con)

# If you want to input multiple values for use in SQL IN statements put `*`
# at the end of the value and the values will be collapsed and quoted appropriately.
glue_sql("SELECT * FROM {`tbl`} WHERE sepal_length IN ({vals*})",
  vals = 1, .con = con)

glue_sql("SELECT * FROM {`tbl`} WHERE sepal_length IN ({vals*})",
  vals = 1:5, .con = con)

glue_sql("SELECT * FROM {`tbl`} WHERE species IN ({vals*})",
  vals = "setosa", .con = con)

glue_sql("SELECT * FROM {`tbl`} WHERE species IN ({vals*})",
  vals = c("setosa", "versicolor"), .con = con)

# If you need to reference a table in a different schema use `DBI::Id()` to
# construct the identifiers.
cols <- c("Sepal.Width", "Sepal.Length", "Species")
col_ids <- lapply(cols, function(x) DBI::Id(table="iris", column = x))
values <- c(1, 2, 'Setosa')
glue_sql("INSERT ({values*}) INTO ({`col_ids`*})", .con=con)



