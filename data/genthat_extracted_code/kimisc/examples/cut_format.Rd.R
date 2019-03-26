library(kimisc)


### Name: cut_format
### Title: Convert Numeric to Factor, with custom formatting
### Aliases: cut_format

### ** Examples

cut_format(runif(10), seq(0, 1, by = 0.25), format_fun = function(x) paste(x * 100, "%"))
cut_format(runif(10), seq(0, 1, by = 0.25), paren = c("<", "{", ">", "}"))



