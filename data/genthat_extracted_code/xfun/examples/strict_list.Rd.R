library(xfun)


### Name: strict_list
### Title: Strict lists
### Aliases: strict_list $.xfun_strict_list print.xfun_strict_list

### ** Examples

library(xfun)
(z = strict_list(aaa = "I am aaa", b = 1:5))
z$a  # NULL!
z$aaa  # I am aaa
z$b
z$c = "create a new element"

z2 = unclass(z)  # a normal list
z2$a  # partial matching



