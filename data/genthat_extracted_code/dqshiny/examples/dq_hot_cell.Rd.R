library(dqshiny)


### Name: dq_hot_cell
### Title: Configure individual cells of rhandsontable widget
### Aliases: dq_hot_cell

### ** Examples

df <- data.frame(readOrWrite = rep(c("readOnly", "change me!"), 5),
  secret = rep("tops3cr3t", 10), stringsAsFactors = FALSE)

hot <- rhandsontable::rhandsontable(df, rowHeaders = NULL)
hot <- dq_hot_cell(hot, seq(1, 10, 2), 1:2, readOnly = TRUE)
hot <- dq_hot_cell(hot, seq(1, 10, 2), 2, type = "password")
hot



