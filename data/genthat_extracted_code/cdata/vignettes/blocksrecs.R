## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ------------------------------------------------------------------------
library(cdata)

iris <- data.frame(iris)
iris$iris_id <- seq_len(nrow(iris))

head(iris, n=1)

## ------------------------------------------------------------------------
(controlTable <- wrapr::qchar_frame(
  flower_part, Length      , Width       |
  Petal      , Petal.Length, Petal.Width |
  Sepal      , Sepal.Length, Sepal.Width ))

columnsToCopy <- "Species"

## ------------------------------------------------------------------------
iris_aug <- rowrecs_to_blocks(
  head(iris, n=1),
  controlTable,
  columnsToCopy = columnsToCopy)

iris_aug

## ------------------------------------------------------------------------
columnsToCopy = qc(iris_id, Species)

# re-do the forward transform, this time
# with the iris_id
iris_aug <- rowrecs_to_blocks(
  head(iris, n=3),
  controlTable,
  columnsToCopy = columnsToCopy)

iris_aug

# demonstrate the reverse transform
iris_back <- blocks_to_rowrecs(
  iris_aug,
  keyColumns = c("iris_id", "Species"),
  controlTable
)

iris_back

## ------------------------------------------------------------------------
# transform the row into a control table
row <- blocks_to_rowrecs(controlTable, 
                         keyColumns = NULL, 
                         controlTable = controlTable)
print(row)

# recover the controlTable from the row
rowrecs_to_blocks(row,
                  controlTable = controlTable)

