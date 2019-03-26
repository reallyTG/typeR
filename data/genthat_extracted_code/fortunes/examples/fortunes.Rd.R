library(fortunes)


### Name: fortunes
### Title: R Fortunes
### Aliases: fortunes read.fortunes fortune print.fortune toLatex.fortune
### Keywords: misc

### ** Examples

fortune() # a random one
fortune("Ripley") # a random one from those with 'Ripley'
fortune(author = "Ripley") # a random one from those by 'Ripley'
fortune(17)

fortune("parse", showMatches = TRUE) # -> shows at least 5 matches
fortune("parse.*answer") # nothing found but...
fortune("parse.*answer", fixed = FALSE) # ...this works

## No test: 
## The first three "all together"   ('setNames()' requires at least R 3.0.0):
lapply(setNames(, c(38, 106, 129)), fortune)
## End(No test)



