library(polmineR)


### Name: size
### Title: Get Number of Tokens.
### Aliases: size size,character-method size,partition-method
###   size,DocumentTermMatrix-method size,TermDocumentMatrix-method
###   size,features-method

### ** Examples

use("polmineR")
size("GERMAPARLMINI")
size("GERMAPARLMINI", s_attribute = "date")
size("GERMAPARLMINI", s_attribute = c("date", "party"))

P <- partition("GERMAPARLMINI", date = "2009-11-11")
size(P, s_attribute = "speaker")
size(P, s_attribute = "party")
size(P, s_attribute = c("speaker", "party"))



