library(R.oo)


### Name: getDocPath.Package
### Title: Gets the path to the accompanying documentation (doc/) directory
###   of this package
### Aliases: getDocPath.Package Package.getDocPath
###   getDocPath,Package-method
### Keywords: internal methods

### ** Examples

  print(list.files(getDocPath(R.oo)))   # explicit call, or
  print(list.files(R.oo$docPath))       # as a virtual field



