library(rebus.base)


### Name: modify_mode
### Title: Apply mode modifiers
### Aliases: modify_mode case_insensitive free_spacing single_line
###   multi_line duplicate_group_names no_backslash_escaping

### ** Examples

x <- "foo"
case_insensitive(x)
free_spacing(x)
single_line(x)
multi_line(x)
duplicate_group_names(x)
no_backslash_escaping(x)
modify_mode(x, c("i", "J", "X"))



