library(kableExtra)


### Name: group_rows
### Title: Put a few rows of a table into one category
### Aliases: group_rows

### ** Examples

x <- knitr::kable(head(mtcars), "html")
# Put Row 2 to Row 5 into a Group and label it as "Group A"
group_rows(x, "Group A", 2, 5)




