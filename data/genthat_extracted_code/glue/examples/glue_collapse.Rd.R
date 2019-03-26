library(glue)


### Name: glue_collapse
### Title: Collapse a character vector
### Aliases: glue_collapse

### ** Examples

glue_collapse(glue("{1:10}"))

# Wide values can be truncated
glue_collapse(glue("{1:10}"), width = 5)

glue_collapse(1:4, ", ", last = " and ")
#> 1, 2, 3 and 4



