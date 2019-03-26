library(importar)


### Name: import
### Title: This function imports/loads packages as in 'Python', i.e.,
###   "import package as alias"
### Aliases: import

### ** Examples

import(dplyr, d)
df <- data.frame(a=1:3, b=4:6)
df %>% d$filter(a == 2)



