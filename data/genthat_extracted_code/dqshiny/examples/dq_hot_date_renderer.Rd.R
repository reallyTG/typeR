library(dqshiny)


### Name: dq_hot_date_renderer
### Title: rhandsontable renderer
### Aliases: dq_hot_date_renderer dq_hot_empty_renderer
###   dq_hot_html_renderer

### ** Examples

df <- data.frame(empty = rep(c("value", ""), 5),
  html = paste0("<div style='background:#ff",sprintf("%x",25*1:10),"ff'>&nbsp;</div>"),
  date = seq(from = Sys.Date(), by = "days", length.out = 10),
  stringsAsFactors = FALSE)

hot <- rhandsontable::rhandsontable(df, rowHeaders = NULL)
hot <- rhandsontable::hot_col(hot, 1, renderer = dq_hot_empty_renderer())
hot <- rhandsontable::hot_col(hot, 2, renderer = dq_hot_html_renderer())
hot <- rhandsontable::hot_col(hot, 3, renderer = dq_hot_date_renderer())
hot



