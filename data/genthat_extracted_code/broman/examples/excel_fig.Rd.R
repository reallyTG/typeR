library(broman)


### Name: excel_fig
### Title: Excel-style figure displaying contents of a matrix
### Aliases: excel_fig
### Keywords: hplot

### ** Examples

df <- data.frame(id=    c(101,  102,  103),
                 sex=   c("M",  "F",  "M"),
                 weight=c(22.3, 15.8, 19.7),
                 stringsAsFactors=FALSE)
excel_fig(df, col_names=TRUE)



