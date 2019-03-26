library(R.utils)


### Name: moveInSearchPath
### Title: Moves a environment in the search path to another position
### Aliases: moveInSearchPath.default moveInSearchPath
### Keywords: programming internal

### ** Examples

  # Make package 'utils' come behind 'datasets' in the search path
  moveInSearchPath("package:utils", "package:datasets", where="after")



