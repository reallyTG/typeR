library(hgutils)


### Name: valid_pkgname
### Title: Validate package and function names
### Aliases: valid_pkgname valid_funcname

### ** Examples

valid_pkgname("hgutils") # valid
valid_pkgname("ggplot2") # valid
valid_pkgname("pkg2.-1") # invalid

valid_funcname(".hgutils") # valid
valid_funcname("ggplot2") # valid
valid_funcname(".2pkg") # invalid



