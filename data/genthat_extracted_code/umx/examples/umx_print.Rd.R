library(umx)


### Name: umx_print
### Title: Print tables in a range of formats (markdown default, see
###   'umx_set_table_format' for other formats) or as a web browser table.
### Aliases: umx_print

### ** Examples

umx_print(mtcars[1:10,], digits = 2, zero.print = ".", justify = "left")
umx_print(mtcars[1,1:2], digits = 2, zero.print = "")
## Not run: 
##D umx_print(mtcars[1:10,], file = "tmp.html")
## End(Not run)



