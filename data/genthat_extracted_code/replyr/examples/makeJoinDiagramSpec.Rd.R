library(replyr)


### Name: makeJoinDiagramSpec
### Title: Build a drawable specification of the join diagram
### Aliases: makeJoinDiagramSpec

### ** Examples



if (requireNamespace("RSQLite", quietly = TRUE)) {
  # note: employeeanddate is likely built as a cross-product
  #       join of an employee table and set of dates of interest
  #       before getting to the join controller step.  We call
  #       such a table "row control" or "experimental design."
  my_db <- DBI::dbConnect(RSQLite::SQLite(), ":memory:")
  RSQLite::initExtension(my_db)
  tDesc <- example_employeeAndDate(my_db)
  # fix order by hand, please see replyr::topoSortTables for
  # how to automate this.
  ord <- match(c('employeeanddate', 'orgtable', 'activity', 'revenue'),
               tDesc$tableName)
  tDesc <- tDesc[ord, , drop=FALSE]
  columnJoinPlan <- buildJoinPlan(tDesc, check= FALSE)
  # unify keys
  columnJoinPlan$resultColumn[columnJoinPlan$resultColumn=='id'] <- 'eid'
  # look at plan defects
  print(paste('problems:',
              inspectDescrAndJoinPlan(tDesc, columnJoinPlan)))
  diagramSpec <- makeJoinDiagramSpec(columnJoinPlan)
  # to render as JavaScript:
  #   DiagrammeR::grViz(diagramSpec)
  DBI::dbDisconnect(my_db)
  my_db <- NULL
}




