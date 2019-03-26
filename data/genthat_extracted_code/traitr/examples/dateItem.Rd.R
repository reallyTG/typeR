library(traitr)


### Name: dateItem
### Title: A calendar date selection item
### Aliases: dateItem

### ** Examples

d <- dateItem(name="d") ## basic usage, no initial date.
# specify intial date and reformat -- can't start in that format, it is amibiguous
d <- dateItem('2000-12-25', format_string='%m-%d-%Y', name='d')



