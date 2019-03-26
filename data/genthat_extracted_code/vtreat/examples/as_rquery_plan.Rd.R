library(vtreat)


### Name: as_rquery_plan
### Title: Convert vtreatment plans into a sequence of rquery operations.
### Aliases: as_rquery_plan

### ** Examples


if(requireNamespace("rquery", quietly = TRUE)) {
   dTrainC <- data.frame(x= c('a', 'a', 'a', 'b' ,NA , 'b'),
                         z= c(1, 2, NA, 4, 5, 6),
                         y= c(FALSE, FALSE, TRUE, FALSE, TRUE, TRUE),
                         stringsAsFactors = FALSE)
   dTrainC$id <- seq_len(nrow(dTrainC))
   treatmentsC <- designTreatmentsC(dTrainC, c("x", "z"), 'y', TRUE)
   print(prepare(treatmentsC, dTrainC))
   rqplan <- as_rquery_plan(list(treatmentsC))
   ops <- flatten_fn_list(rquery::local_td(dTrainC), rqplan$optree_generators)
   cat(format(ops))
   if(requireNamespace("rqdatatable", quietly = TRUE)) {
      treated <- rqdatatable::ex_data_table(ops, tables = rqplan$tables)
      print(treated[])
   }
   if(requireNamespace("DBI", quietly = TRUE) &&
      requireNamespace("RSQLite", quietly = TRUE)) {
      db <- DBI::dbConnect(RSQLite::SQLite(), ":memory:")
      source_data <- rquery::rq_copy_to(db, "dTrainC", dTrainC,
                               overwrite = TRUE, temporary = TRUE)

      rest <- rquery_prepare(db, rqplan, source_data, "dTreatedC", 
                                  extracols = "id")
      resd <- DBI::dbReadTable(db, rest$table_name)
      print(resd)

      rquery::rq_remove_table(db, source_data$table_name)
      rquery::rq_remove_table(db, rest$table_name)
      DBI::dbDisconnect(db)
   }
}




