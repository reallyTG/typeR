library(polmineR)


### Name: kwic-class
### Title: kwic (S4 class)
### Aliases: kwic-class [,kwic,ANY,ANY,ANY-method [,kwic-method
###   show,kwic-method knit_print,kwic-method as.character,kwic-method
###   subset,kwic-method as.data.frame,kwic-method length,kwic-method
###   sample,kwic-method enrich,kwic-method view,kwic-method

### ** Examples

use("polmineR")
K <- kwic("GERMAPARLMINI", "Integration")
length(K)
K_min <- K[1]
K_min <- K[1:5]
oil <- kwic("REUTERS", query = "oil")
as.character(oil)



