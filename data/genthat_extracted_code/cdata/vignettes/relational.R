## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ------------------------------------------------------------------------
library(cdata)

iris <- data.frame(iris)


(controlTable <- wrapr::qchar_frame(
  flower_part, Length      , Width       |
  Petal      , Petal.Length, Petal.Width |
  Sepal      , Sepal.Length, Sepal.Width ))

row <- blocks_to_rowrecs(controlTable, 
                         keyColumns = NULL, 
                         controlTable = controlTable)
print(row)

# recover the controlTable from the row!
rowrecs_to_blocks(row,
                  controlTable = controlTable)

