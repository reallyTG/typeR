library(labelled)


### Name: remove_labels
### Title: Remove variable label, value labels and user defined missing
###   values
### Aliases: remove_labels remove_var_label remove_val_labels
###   remove_user_na user_na_to_na

### ** Examples

x1 <- labelled_spss(1:10, c(Good = 1, Bad = 8), na_values = c(9, 10))
var_label(x1) <- "A variable"
x1

x2 <- remove_labels(x1)
x2
x3 <- remove_labels(x1, user_na_to_na = TRUE)
x3
x4 <- remove_user_na(x1, user_na_to_na = TRUE)
x4



