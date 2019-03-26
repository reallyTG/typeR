library(scriptests)


### Name: source.pkg
### Title: Quickly load code and data of a package
### Aliases: source.pkg
### Keywords: misc

### ** Examples

## Not run: 
##D # sourcing the code in a package stored in <mypackage>/{DESCRIPTION,R,man,tests}:
##D source.pkg("<mypackage>")
##D # sourcing the code in a package stored in path/to/dir/<mypackage>/{DESCRIPTION,R,man,tests}:
##D source.pkg("<mypackage>", path="path/to/dir")
##D # sourcing the code in a package stored in pkg/{DESCRIPTION,R,man,tests}:
##D # where "pkg" is unrelated to the name of the pacakage
##D source.pkg("pkg", path="path/to/dir")
##D # sourcing the code in a package stored in <mypackage>/pkg/{DESCRIPTION,R,man,tests}:
##D source.pkg("<mypackage>", path="$PKG/pkg")
## End(Not run)



