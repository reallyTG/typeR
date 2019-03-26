library(rhandsontable)


### Name: hot_table
### Title: Handsontable widget
### Aliases: hot_table

### ** Examples

library(rhandsontable)
DF = data.frame(val = 1:10, bool = TRUE, big = LETTERS[1:10],
                small = letters[1:10],
                dt = seq(from = Sys.Date(), by = "days", length.out = 10),
                stringsAsFactors = FALSE)

rhandsontable(DF) %>%
hot_table(highlightCol = TRUE, highlightRow = TRUE)



