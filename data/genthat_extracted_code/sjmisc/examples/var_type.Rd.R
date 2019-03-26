library(sjmisc)


### Name: var_type
### Title: Determine variable type
### Aliases: var_type

### ** Examples

data(efc)

var_type(1)
var_type(1L)
var_type("a")

var_type(efc$e42dep)
var_type(to_factor(efc$e42dep))

library(dplyr)
var_type(efc, contains("cop"))




