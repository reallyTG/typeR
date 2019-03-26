library(rquery)


### Name: complete_design
### Title: Complete an experimental design.
### Aliases: complete_design

### ** Examples


if (requireNamespace("DBI", quietly = TRUE) &&
    requireNamespace("RSQLite", quietly = TRUE)) {
  my_db <- DBI::dbConnect(RSQLite::SQLite(), ":memory:")

  # example experimental design
  values <- list(nums = 1:3, lets = c("a", "b"))
  design <- expand_grid(my_db, values)

  # not quite matching data
  data <- build_frame(
    "nums", "lets"   |
      1L    , "a"    |
      1L    , "b"    |
      77L   , "a"    |  # out of place ID
      2L    , "b"    |
      3L    , "a"    |
      3L    , "a"    | # duplicated
      3L    , "b"    )
  data$row_number <- seq_len(nrow(data))
  data <- rq_copy_to(my_db, "data", data)

  # compare/augment
  res <- complete_design(design, data)
  cat(format(res))
  res <- materialize(my_db, res)

  print("completed data design")
  print(execute(my_db, res))

  # look for dups (can use extende_se(partation) on
  # databases with window fns.
  print("duplicate key rows:")
  res %.>%
    project_se(.,
               groupby = column_names(design),
               "count" %:=% "SUM(1)") %.>%
    select_rows_se(., "count>1") %.>%
    execute(my_db, .) %.>%
    print(.)

  # look for data that was not in design
  print("data rows not in design:")
  data %.>%
    natural_join(., res,
                 jointype = "LEFT",
                 by = column_names(design)) %.>%
    select_rows_se(., "is.na(row_in_design_table)") %.>%
    execute(my_db, .) %.>%
    print(.)

  DBI::dbDisconnect(my_db)
}




