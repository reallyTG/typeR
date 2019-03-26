library(hutils)


### Name: duplicated_rows
### Title: Return duplicated rows of data.table
### Aliases: duplicated_rows

### ** Examples


if (requireNamespace("data.table", quietly = TRUE)) {
  library(data.table)

  DT <- data.table(x = rep(1:4, 3),
                   y = rep(1:2, 6),
                   z = rep(1:3, 4))

  # No duplicates
  duplicated_rows(DT)

  # x and y have duplicates
  duplicated_rows(DT, by = c("x", "y"), order = FALSE)

  # By default, the duplicate rows are presented adjacent to each other.
  duplicated_rows(DT, by = c("x", "y"))
}




