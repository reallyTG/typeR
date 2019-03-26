library(kableExtra)


### Name: footnote_marker_number
### Title: Footnote marker
### Aliases: footnote_marker_number footnote_marker_alphabet
###   footnote_marker_symbol

### ** Examples

dt <- mtcars[1:5, 1:5]
colnames(dt)[1] <- paste0("mpg", footnote_marker_alphabet(2, "html"))
rownames(dt)[2] <- paste0(rownames(dt)[2], footnote_marker_alphabet(1, "html"))
footnote(knitr::kable(dt, "html"), alphabet = c("Note a", "Note b"))




