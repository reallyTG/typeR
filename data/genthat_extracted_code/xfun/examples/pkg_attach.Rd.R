library(xfun)


### Name: pkg_attach
### Title: Attach or load packages, and automatically install missing
###   packages if requested
### Aliases: pkg_attach pkg_load loadable pkg_attach2 pkg_load2

### ** Examples

library(xfun)
pkg_attach("stats", "graphics")
# pkg_attach2('servr') # automatically install servr if it is not installed

(pkg_load("stats", "graphics"))



