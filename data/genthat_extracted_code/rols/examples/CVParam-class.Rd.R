library(rols)


### Name: CVParam-class
### Title: Class '"CVParam"'
### Aliases: CVParam-class CVParam coerce,CVParam,character-method
###   coerce,character,CVParam-method show,CVParam-method
###   rep,CVParam-method as.character.CVParam as.CVParam.character
###   charIsCVParam
### Keywords: classes

### ** Examples

## a user param
CVParam(name = "A user param", value = "the value")
## a CVParam from PSI's Mass Spectrometry ontology
term("MS", "MS:1000073")
CVParam(label = "MS", accession = "MS:1000073")
CVParam(label = "MS", name ="electrospray ionization")
CVParam(label = "MS", name ="ESI") ## using a synonym

## From a CVParam object to a character
cv <- as(CVParam(label = "MS", accession = "MS:1000073"), "character")
cv

## From a character object to a CVParam
as(cv, "CVParam")
as("[MS, MS:1000073, , ]", "CVParam") ## no name
as("[MS, MS:1000073, ESI, ]", "CVParam") ## name does not match
as(c(cv, cv), "CVParam") ## more than 1 character

x <- c("[MS, MS:1000073, , ]", ## valid CV param
       "[, , Hello, world]",   ## valid User param
       "[this, one is, not, valid]", ## not valid
       "[ , , , ]") ## not valid

stopifnot(charIsCVParam(x) == c(TRUE, TRUE, FALSE, FALSE))

## A list of expected valid and non-valid entries
rols:::validCVchars
rols:::notvalidCVchars



