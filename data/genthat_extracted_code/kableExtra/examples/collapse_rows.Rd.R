library(kableExtra)


### Name: collapse_rows
### Title: Collapse repeated rows to multirow cell
### Aliases: collapse_rows

### ** Examples

dt <- data.frame(a = c(1, 1, 2, 2), b = c("a", "a", "a", "b"))
x <- knitr::kable(dt, "html")
collapse_rows(x)




