library(rquery)


### Name: actualize_join_plan
### Title: Execute an ordered sequence of left joins.
### Aliases: actualize_join_plan

### ** Examples


if (requireNamespace("DBI", quietly = TRUE) && requireNamespace("RSQLite", quietly = TRUE)) {
  my_db <- DBI::dbConnect(RSQLite::SQLite(), ":memory:")
  # example data
  DBI::dbWriteTable(my_db,
                    "meas1",
                    data.frame(id= c(1,2),
                               weight= c(200, 120),
                               height= c(60, 14)))
  DBI::dbWriteTable(my_db,
                    "meas2",
                    data.frame(pid= c(2,3),
                               weight= c(105, 110),
                               width= 1))
  # get the initial description of table defs
  tDesc <- describe_tables(my_db, qc(meas1, meas2))
  # declare keys (and give them consitent names)
  tDesc$keys[[1]] <- list(PatientID= 'id')
  tDesc$keys[[2]] <- list(PatientID= 'pid')
  # build the column join plan
  columnJoinPlan <- build_join_plan(tDesc)
  # decide we don't want the width column
  columnJoinPlan$want[columnJoinPlan$resultColumn=='width'] <- FALSE
  # double check our plan
  if(!is.null(inspect_join_plan(tDesc, columnJoinPlan,
                                checkColClasses= TRUE))) {
    stop("bad join plan")
  }
  # actualize as left join op_tree
  optree <- actualize_join_plan(columnJoinPlan,
                                checkColClasses= TRUE)
  cat(format(optree))
  print(execute(my_db, optree))
  if(requireNamespace("DiagrammeR", quietly = TRUE)) {
    DiagrammeR::grViz(op_diagram(optree))
  }
  DBI::dbDisconnect(my_db)
}




