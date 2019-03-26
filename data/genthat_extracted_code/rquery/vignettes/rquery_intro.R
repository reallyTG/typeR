## ----chpkg---------------------------------------------------------------
run_vignette <- requireNamespace("DBI", quietly = TRUE) && 
  requireNamespace("RSQLite", quietly = TRUE)

## ----setup, eval=run_vignette--------------------------------------------
library("rquery")
library("wrapr")

# example database connection
db <- DBI::dbConnect(RSQLite::SQLite(),
                     ":memory:")
RSQLite::initExtension(db)

# adapt to database
dbopts <- rq_connection_tests(db)
print(dbopts)
options(dbopts)

# register database
old_o <- options(list("rquery.rquery_db_executor" = list(db = db)))

## ----tabledescr1---------------------------------------------------------
# copy in example data
rq_copy_to(
  db, 'd',
  data.frame(v = c(1, -5, 3)),
  temporary = FALSE,
  overwrite = TRUE)

# produce a hande to existing table
d <- db_td(db, "d")

## ----isna, eval=run_vignette---------------------------------------------
d %.>% 
  extend(., was_na := ifelse(is.na(v), 1, 0)) %.>%
  to_sql(., db) %.>%
  cat(.)

## ----logisticex, eval=run_vignette---------------------------------------
scale <- 0.237

dq <- mk_td("d3", 
                   columns = qc(subjectID, 
                                surveyCategory, 
                                assessmentTotal)) %.>%
  extend(.,
             probability :=
               exp(assessmentTotal * scale))  %.>% 
  normalize_cols(.,
                 "probability",
                 partitionby = 'subjectID') %.>%
  pick_top_k(.,
             partitionby = 'subjectID',
             orderby = c('probability', 'surveyCategory'),
             reverse = c('probability')) %.>% 
  rename_columns(., 'diagnosis' := 'surveyCategory') %.>%
  select_columns(., c('subjectID', 
                      'diagnosis', 
                      'probability')) %.>%
  orderby(., 'subjectID')

## ----logprops, eval=run_vignette-----------------------------------------
tables_used(dq)

columns_used(dq)

column_names(dq)

## ----printlogistic, eval=run_vignette------------------------------------
cat(format(dq))

## ----printlogisticsq, eval=run_vignette----------------------------------
cat(to_sql(dq, db))

## ----rsummaryex, eval=run_vignette---------------------------------------
d %.>%
  rsummary_node(.) %.>%
  execute(db, .)

## ----assignmentpart, eval=run_vignette-----------------------------------
ot <- mk_td('d4',
                   columns = qc('a', 'b', 'c', 'd')) %.>%
  extend(., 
             x = a + 1,
             y = x + 1,
             u = b + 1,
             v = c + 1,
             w = d + 1)

cat(format(ot))

## ----ifelseblock, eval=run_vignette--------------------------------------
ifet <- mk_td("d5",
                     columns = "test") %.>%
  extend_se(.,
            c(qae(x = '',
                  y = ''),
              if_else_block(
                qe(test > 5),
                thenexprs = qae(x = 'a', 
                                y = 'b'),
                elseexprs = qae(x = 'b', 
                                y = 'a')
              )))
cat(format(ifet))

## ---- eval=run_vignette--------------------------------------------------
wp <- mk_td(table = 'd6',
                   columns = letters[1:5]) %.>%
  extend(., res := a + b)

# full query
cat(to_sql(wp, db))

# longer pipeline
wn <- wp %.>%
  select_columns(., "res")

# notice select at end of the pipeline automatically 
# gets propagated back to the beginning of the
# pipeline
cat(to_sql(wn, db))

## ----cleanup, eval=run_vignette------------------------------------------
options(old_o)
DBI::dbDisconnect(db)

