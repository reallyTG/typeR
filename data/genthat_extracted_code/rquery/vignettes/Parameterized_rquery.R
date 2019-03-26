## ----pkgs, message=FALSE, warning=FALSE----------------------------------
have_rqdatatable <- FALSE
if (requireNamespace("rqdatatable", quietly = TRUE)) {
  library("rqdatatable")
  have_rqdatatable <- TRUE
}
have_db <- FALSE
if (requireNamespace("RSQLite", quietly = TRUE) &&
    requireNamespace("DBI", quietly = TRUE)) {
  have_db <- TRUE
}

## ------------------------------------------------------------------------
library("rquery")

# define our parameters
# pretend these come from far away
# or as function arguments.
group_nm <- "am"
num_nm <- as.name("hp")
den_nm <- as.name("cyl")
derived_nm <- as.name(paste0(num_nm, "_per_", den_nm))
mean_nm <- as.name(paste0("mean_", derived_nm))
count_nm <- as.name("group_count")

## ---- eval = have_rqdatatable--------------------------------------------
# apply a parameterized pipeline using bquote
mtcars %.>%
  extend(., 
         .(derived_nm) := .(num_nm)/.(den_nm)) %.>%
  project(., 
          .(mean_nm) := mean(.(derived_nm)),
          .(count_nm) := length(.(derived_nm)),
          groupby = group_nm) %.>%
  orderby(., 
          group_nm)

## ------------------------------------------------------------------------
# make an abstract description of the table to start with
td <- mk_td("mtcars",
            as.character(list(group_nm, num_nm, den_nm)))

# helper function to adapt to later database environemnt
count <- function(v) { length(v) }

# capture the operator pipeline
ops <- td %.>%
  extend(., 
         .(derived_nm) := .(num_nm)/.(den_nm)) %.>%
  project(., 
          .(mean_nm) := mean(.(derived_nm)),
          .(count_nm) := count(.(derived_nm)),
          groupby = group_nm) %.>%
  orderby(., 
          group_nm)


## ----localexec, eval=have_rqdatatable, message=FALSE, warning=FALSE------
# apply it to data
mtcars %.>% ops

## ----message=FALSE, warning=FALSE----------------------------------------
# print the operator sequence
cat(format(ops))

## ----eval=FALSE, message=FALSE, warning=FALSE----------------------------
#  # draw the pipeline
#  ops %.>%
#    op_diagram(.) %.>%
#    DiagrammeR::grViz(.)

## ----dbex, eval=have_db, message=FALSE, warning=FALSE--------------------
# connect to a database
raw_connection <- DBI::dbConnect(RSQLite::SQLite(), ":memory:")

# build a representation of the database connection
dbopts <- rq_connection_tests(raw_connection)
db <- rquery_db_info(connection = raw_connection,
                     is_dbi = TRUE,
                     connection_options = dbopts)
print(db)

# copy data to db
tr <- rquery::rq_copy_to(db, "mtcars", mtcars, 
                         temporary = TRUE, 
                         overwrite = TRUE)
print(tr)

# materialize result remotely (without passing through R)
res <- materialize(db, ops)
DBI::dbReadTable(raw_connection, res$table_name)

# or execute and pull results back
execute(db, ops)

# print the derived sql
sql <- to_sql(ops, db)
cat(sql)

# disconnect
DBI::dbDisconnect(raw_connection)
rm(list = c("raw_connection", "db"))

