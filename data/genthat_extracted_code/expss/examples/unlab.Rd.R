library(expss)


### Name: unlab
### Title: Drop variable label and value labels
### Aliases: unlab drop_all_labels

### ** Examples

raw_var = rep(1:2,5)
var_with_lab = set_var_lab(raw_var,"Income")
val_lab(var_with_lab) = c("Low"=1,"High"=2)
identical(raw_var,unlab(var_with_lab)) # should be TRUE



