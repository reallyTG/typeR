## ----setup, include=FALSE------------------------------------------------
execute_vignette <- requireNamespace("RSQLite", quietly = TRUE)
if(execute_vignette) {
  my_db <- DBI::dbConnect(RSQLite::SQLite(), ":memory:")
  RSQLite::initExtension(my_db)
  exDesc <- replyr::example_employeeAndDate(my_db)
}

## ----tableNames, eval=execute_vignette-----------------------------------
tableNames <- c('employeeanddate',
                'revenue',
                'activity',
                'orgtable')

## ----builddesc, eval=execute_vignette------------------------------------
suppressPackageStartupMessages(library("dplyr"))
library("replyr")

tDesc <- tableNames %>%
  lapply(
    function(ni) {
      replyr::tableDescription(ni,
                               dplyr::tbl(my_db, ni),
                               keyInspector= key_inspector_sqlite)
    }) %>%
  bind_rows()

print(tDesc[, c('tableName', 'handle', 'keys', 'columns'), ])

## ----plan1, eval=execute_vignette----------------------------------------
columnJoinPlan <- buildJoinPlan(tDesc, check= FALSE)
print(columnJoinPlan[, c('tableName', 'sourceColumn', 'resultColumn', 'isKey')])

## ----rekey, eval=execute_vignette----------------------------------------
columnJoinPlan$resultColumn[columnJoinPlan$sourceColumn=='id'] <- 'eid'
print(columnJoinPlan[, c('tableName', 'sourceColumn', 'resultColumn', 'isKey')])

## ----check1, eval=execute_vignette---------------------------------------
print(paste("issues:", inspectDescrAndJoinPlan(tDesc, columnJoinPlan)))

## ----sort, eval=execute_vignette-----------------------------------------
sorted <- NULL
# requireNamespace checks just for strict warning hygiene in vignette
if(requireNamespace('igraph', quietly = TRUE)) {
  sorted <- topoSortTables(columnJoinPlan, 'employeeanddate')
  plot(sorted$dependencyGraph)
  print(sorted$tableOrder)
}

## ----check2, eval=execute_vignette---------------------------------------
if(!is.null(sorted)) {
  print(paste("issues:", inspectDescrAndJoinPlan(tDesc, 
                                                 sorted$columnJoinPlan)))
}

## ----steps, eval=execute_vignette----------------------------------------
if(!is.null(sorted)) {
  print("join plan execution log")
  res <- executeLeftJoinPlan(tDesc, 
                             sorted$columnJoinPlan,
                             verbose = TRUE)
  print("join results")
  dplyr::glimpse(res)
}

## ----cleanup, eval=execute_vignette--------------------------------------
DBI::dbDisconnect(my_db)

