library(rhandsontable)


### Name: hot_validate_character
### Title: Handsontable widget
### Aliases: hot_validate_character

### ** Examples

library(rhandsontable)
DF = data.frame(val = 1:10, bool = TRUE, big = LETTERS[1:10],
                small = letters[1:10],
                dt = seq(from = Sys.Date(), by = "days", length.out = 10),
                stringsAsFactors = FALSE)

rhandsontable(DF) %>%
  hot_validate_character(col = "big", choices = LETTERS[1:10])



