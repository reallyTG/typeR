## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ------------------------------------------------------------------------
(controlTable <- wrapr::qchar_frame(
  flower_part, Length      , Width       |
  Petal      , Petal.Length, Petal.Width |
  Sepal      , Sepal.Length, Sepal.Width ))

(columnsToCopy <- "Species")


## ------------------------------------------------------------------------
library("cdata")

iris_aug <- rowrecs_to_blocks(
  iris,
  controlTable = controlTable,
  columnsToCopy = columnsToCopy) 

head(iris_aug)

## ------------------------------------------------------------------------
# grab a record to use to build our control table 
ct <- iris_aug[1:2, c("flower_part", "Length", "Width")]
print(ct)

# replace values with desired column names
# as in this case the values are unique we can do
# this mechanically, normally we do this by hand
for(i in 1:nrow(ct)) {
  for(j in 2:ncol(ct)) {
    ct[i,j] <- colnames(iris)[which(iris[1,]==ct[i,j])]
  }
}

print(ct)

