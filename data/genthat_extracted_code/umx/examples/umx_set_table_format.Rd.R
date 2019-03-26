library(umx)


### Name: umx_set_table_format
### Title: umx_set_table_format
### Aliases: umx_set_table_format

### ** Examples

library(umx)
umx_set_table_format() # show current state
old = umx_set_table_format() # store existing value
umx_set_table_format("latex")
umx_set_table_format("html")
umx_set_table_format("markdown")
umx_set_table_format("") # get available options
umx_set_table_format(old)    # reinstate



