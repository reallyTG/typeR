library(xfun)


### Name: attr
### Title: Obtain an attribute of an object without partial matching
### Aliases: attr

### ** Examples

z = structure(list(a = 1), foo = 2)
base::attr(z, "f")  # 2
xfun::attr(z, "f")  # NULL
xfun::attr(z, "foo")  # 2



