library(crayon)


### Name: drop_style
### Title: Remove a style
### Aliases: drop_style

### ** Examples

make_style(new_style = "maroon", bg = TRUE)
cat(style("I am maroon", "new_style"), "\n")
drop_style("new_style")
"new_style" %in% names(styles())



