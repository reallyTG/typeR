library(rhandsontable)


### Name: hot_cell
### Title: Handsontable widget
### Aliases: hot_cell

### ** Examples

library(rhandsontable)
DF = data.frame(val = 1:10, bool = TRUE, big = LETTERS[1:10],
                small = letters[1:10],
                dt = seq(from = Sys.Date(), by = "days", length.out = 10),
                stringsAsFactors = FALSE)

rhandsontable(DF) %>%
  hot_cell(1, 1, comment = "Test comment") %>%
  hot_cell(2, 3, readOnly = TRUE)



