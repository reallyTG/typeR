library(optional)


### Name: opt_unwrap
### Title: Option Unwrap
### Aliases: opt_unwrap

### ** Examples

a <- option(5)
class(a)
## [1] "optional"
a <- opt_unwrap(a)

class(a)
## [1] "numeric"



