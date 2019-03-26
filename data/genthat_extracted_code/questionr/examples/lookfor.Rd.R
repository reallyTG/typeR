library(questionr)


### Name: lookfor
### Title: Look for keywords variable names and descriptions
### Aliases: lookfor

### ** Examples

lookfor(iris)
# Look for a single keyword.
lookfor(iris, "petal")
lookfor(iris, "s")
# Look for with a regular expression
lookfor(iris, "petal|species")
lookfor(iris, "s$")
# Look for with several keywords
lookfor(iris, "pet", "sp")
lookfor(iris, "pet", "sp", "width")
# Load memisc package and example data.
## Not run: 
##D require(memisc)
##D nes1948.por <- UnZip("anes/NES1948.ZIP","NES1948.POR", package="memisc")
##D nes1948 <- spss.portable.file(nes1948.por)
##D # Look for a vector of keywords.
##D lookfor(nes1948, c("Truman", "Dewey"))
##D # Look for a regular expression.
##D lookfor(nes1948, "truman|dewey")
##D # Look for a phrase.
##D lookfor(nes1948, "personal attribute")
## End(Not run)
# Labelled data
data(fecondite)
lookfor(femmes)
lookfor(femmes, "date")
# Display details
lookfor(femmes, details = TRUE)



