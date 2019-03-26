library(R.oo)


### Name: Package
### Title: The Package class provides methods for accessing package
###   information
### Aliases: Package
### Keywords: programming methods classes

### ** Examples
## Not run: 
##D # By defining .onAttach() as follows in zzz.R for a package, an
##D # instance of class Package with the same name as the package will
##D # be made available on the search path. More over, the code below
##D # will also inform the user that the package has been loaded:
##D #
##D #  > library(R.oo)
##D #  R.oo v0.52 (2003/04/13) was successfully loaded.
##D #
##D .onAttach <- function(libname, pkgname) {
##D   pkg <- Package(pkgname)
##D   assign(pkgname, pkg, pos=getPosition(pkg))
##D   cat(getName(pkg), " v", getVersion(pkg), " (", getDate(pkg), ")",
##D     " was successfully loaded.\n", sep="")
##D }
##D 
##D # The Package class works for any packages, loaded or not.
##D 
##D # Some information about the base package
##D pkg <- Package("base")
##D print(pkg)
##D # [1] "Package: base v1.6.2 (NA) is loaded (pos=5). The official webpage
##D #      is NA and the maintainer is R Core Team <R-core@r-project.org>. The
##D #      package is installed in c:/PROGRA~1/R/rw1062/library/base/."
##D print(list.files(Package("base")$dataPath))
##D 
##D # Some information about the R.oo package
##D print(R.oo::R.oo)
##D # [1] "Package: R.oo v0.52 (2003/04/13) is loaded (pos=2). The official
##D #      webpage is http://www.braju.com/R/ and the maintainer is Henrik
##D #      Bengtsson <henrikb@braju.com>. The package is installed in
##D #      c:/PROGRA~1/R/rw1062/library/R.oo/."
## End(Not run)


