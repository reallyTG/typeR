library(ezsim)


### Name: createFormula
### Title: Create Formula From a Vector of Character.
### Aliases: createFormula
### Keywords: internal

### ** Examples

## Not run: 
##D createFormula(letters[1])  ## . ~ a
##D createFormula(letters[1],right=FALSE)  ## a ~ .
##D createFormula(letters[1:3])  ## c ~ a + b
##D createFormula(letters[1:4])  ## c + d ~ a + b
##D createFormula(letters[1:4],right=FALSE) ## a + b ~ c + d
## End(Not run)



