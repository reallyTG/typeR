library(testextra)


### Name: namespaces
### Title: Create namespace environments
### Aliases: namespaces new_namespace_env new_pkg_environment
###   register_namespace unregister_namespace is_namespace_registered

### ** Examples

ns <- new_namespace_env('my namespace')
isNamespace(ns)
environmentName(ns)
packageName(ns) # not a package

pkg <- new_pkg_environment("myPackage")
isNamespace(pkg)
environmentName(pkg)
packageName(pkg)             # now a package
is_namespace_registered(pkg) # but not registered
## Not run: 
##D asNamespace("myPackage")     # so this WILL NOT work.
## End(Not run)

register_namespace(pkg)
is_namespace_registered(pkg) # now registered
asNamespace("myPackage")     # so this WILL work.

unregister_namespace(pkg)
is_namespace_registered(pkg) # now unregistered
isNamespace(pkg)             # but still a namespace




