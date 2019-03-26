library(finalfit)


### Name: variable_type
### Title: Determine type/class of a variable
### Aliases: variable_type
### Keywords: internal

### ** Examples

var_d = as.Date("12.03.18", "%d.%m.%y")
var_f = factor(c("yes", "no"))
var_c = c("yes", "no")
var_n = 1:10
var_l = as.logical(c("true", "false"))
variable_type(var_d)
variable_type(var_f)
variable_type(var_c)
variable_type(var_n)
variable_type(var_l)



