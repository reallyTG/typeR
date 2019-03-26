library(replyr)


### Name: topoSortTables
### Title: Topologically sort join plan so values are available before
###   uses.
### Aliases: topoSortTables

### ** Examples


if (requireNamespace("RSQLite", quietly = TRUE)) {
  # note: employeeanddate is likely built as a cross-product
  #       join of an employee table and set of dates of interest
  #       before getting to the join controller step.  We call
  #       such a table "row control" or "experimental design."
  my_db <- DBI::dbConnect(RSQLite::SQLite(), ":memory:")
  RSQLite::initExtension(my_db)
  tDesc <- example_employeeAndDate(my_db)
  columnJoinPlan <- buildJoinPlan(tDesc, check= FALSE)
  # unify keys
  columnJoinPlan$resultColumn[columnJoinPlan$resultColumn=='id'] <- 'eid'
  # look at plan defects
  print(paste('problems:',
              inspectDescrAndJoinPlan(tDesc, columnJoinPlan)))
  # fix plan
  if(requireNamespace('igraph', quietly = TRUE)) {
    sorted <- topoSortTables(columnJoinPlan, 'employeeanddate')
    print(paste('problems:',
                inspectDescrAndJoinPlan(tDesc, sorted$columnJoinPlan)))
    # plot(sorted$dependencyGraph)
  }
  DBI::dbDisconnect(my_db)
  my_db <- NULL
}




