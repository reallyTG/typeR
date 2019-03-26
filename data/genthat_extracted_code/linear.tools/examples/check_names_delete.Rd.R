library(linear.tools)


### Name: check_names_delete
### Title: check whether list names (tobechecked) is within specified sets
###   ('checking')
### Aliases: check_names_delete
### Keywords: internal

### ** Examples


tobechecked = list('cut' = 1, 'dwewsdfds' = 2); checking = 'cut'

result =   check_names_delete(tobechecked, checking, STOP = FALSE,
                              tobechecked_name = 'focus_var',
                              checking_name = 'all_raw_vars')
result

result = check_names_delete(tobechecked, checking, STOP = FALSE)
result

tobechecked = c('cut', 'dsfsf'); checking = 'cut'
result = check_names_delete(tobechecked, checking, STOP = FALSE)
result




