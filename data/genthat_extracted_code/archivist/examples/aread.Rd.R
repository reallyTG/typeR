library(archivist)


### Name: aread
### Title: Read Artifacts Given as md5hashes from the Repository
### Aliases: aread

### ** Examples

# read the object from local directory
setLocalRepo(system.file("graphGallery", package = "archivist"))
pl <- aread("7f3453331910e3f321ef97d87adb5bad")
# To plot it remember to have ggplot2 in version 2.1.0
# as this is stated in asession("7f3453331910e3f321ef97d87adb5bad") .
# The state of R libraries can be restored to the same state in
# which 7f3453331910e3f321ef97d87adb5bad was created with the restoreLibs function.

# read the object from Remote
pl <- aread("pbiecek/graphGallery/7f3453331910e3f321ef97d87adb5bad")
# To plot it remember to have ggplot2 in version 2.1.0
# as this is stated in asession("pbiecek/graphGallery/7f3453331910e3f321ef97d87adb5bad") .
# The state of R libraries can be restored to the same state in
# which 7f3453331910e3f321ef97d87adb5bad was created with the restoreLibs function.



