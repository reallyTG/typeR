## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)
run_vignette <- requireNamespace("DBI", quietly = TRUE) && requireNamespace("RSQLite", quietly = TRUE)

## ----ex, warning=FALSE, message=FALSE, include=FALSE, eval=run_vignette----
library("rquery")
library("wrapr")

# this db does not have window fns
my_db <- DBI::dbConnect(RSQLite::SQLite(), 
                        ":memory:")

dbopts <- rq_connection_tests(my_db)
print(dbopts)
options(dbopts)

# copy in example data
d_local <- build_frame(
   "subjectID", "surveyCategory"     , "assessmentTotal", "irrelevantCol1", "irrelevantCol2" |
   1          , "withdrawal behavior", 5                , "irrel1"        , "irrel2"         |
   1          , "positive re-framing", 2                , "irrel1"        , "irrel2"         |
   2          , "withdrawal behavior", 3                , "irrel1"        , "irrel2"         |
   2          , "positive re-framing", 4                , "irrel1"        , "irrel2"         )
rq_copy_to(my_db, 'd',
            d_local,
            temporary = TRUE, 
            overwrite = TRUE)

## ----calc, eval=run_vignette---------------------------------------------
# produce a hande to existing table
d <- db_td(my_db, "d")

scale <- 0.237

dq <- d %.>%
  extend(.,
         probability :=
           exp(assessmentTotal * scale)/
           sum(exp(assessmentTotal * scale)),
         count := count(1),
         partitionby = 'subjectID') %.>%
  extend(.,
         rank := rank(),
         partitionby = 'subjectID',
         orderby = c('probability', 'surveyCategory'))  %.>%
  rename_columns(., 'diagnosis' := 'surveyCategory') %.>%
  select_rows(., rank == count) %.>%
  select_columns(., c('subjectID', 
                      'diagnosis', 
                      'probability')) %.>%
  orderby(., 'subjectID')

class(my_db)

## ----pf, echo=FALSE, comment = ' ', eval=run_vignette--------------------
cat(format(dq))

## ----res, echo=FALSE, comment = ' ', eval=run_vignette-------------------
sql <- to_sql(dq, db = my_db, source_limit = 1000)

cat(sql)

## ----cleanup, include=FALSE, eval=run_vignette---------------------------
DBI::dbDisconnect(my_db)

