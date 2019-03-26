library(FSA)


### Name: FSAUtils
### Title: Capitalizes the first letter of first or all words in a string.
### Aliases: FSAUtils capFirst
### Keywords: manip

### ** Examples

## Capitalize first letter of all words (the default)
capFirst("Derek Ogle")
capFirst("derek ogle")
capFirst("derek")

## Capitalize first letter of only the first words
capFirst("Derek Ogle",which="first")
capFirst("derek ogle",which="first")
capFirst("derek",which="first")
## apply to all elements in a vector
vec <- c("Derek Ogle","derek ogle","Derek ogle","derek Ogle","DEREK OGLE")
capFirst(vec)
capFirst(vec,which="first")

## check class types
class(vec)
vec1 <- capFirst(vec)
class(vec1)
fvec <- factor(vec)
fvec1 <- capFirst(fvec)
class(fvec1)




