library(importar)


### Name: import_fun
### Title: This function imports/loads functions as in 'Python', i.e.,
###   "from package import function as alias"
### Aliases: import_fun

### ** Examples

import_fun(dplyr, filter, fil)
df <- data.frame(a=1:3, b=4:6)
fil(df, a == 2)



