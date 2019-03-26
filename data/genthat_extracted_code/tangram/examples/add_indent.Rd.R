library(tangram)


### Name: add_indent
### Title: Add indentations to left column row headers
### Aliases: add_indent

### ** Examples

x <- tangram(drug ~ bili + albumin, pbc)
add_indent(x)
add_indent(x, amounts=10)
add_indent(x, amounts=c(0, 0, 2, 4))
add_indent(x, rows=c(3))
add_indent(x, rows=c(3, 4), amounts=c(4, 2))



