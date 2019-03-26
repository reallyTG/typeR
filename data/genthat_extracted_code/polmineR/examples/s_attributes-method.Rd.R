library(polmineR)


### Name: s_attributes
### Title: Get s-attributes.
### Aliases: s_attributes s_attributes,character-method
###   s_attributes,partition-method

### ** Examples

use("polmineR")
  
s_attributes("GERMAPARLMINI")
s_attributes("GERMAPARLMINI", "date") # dates of plenary meetings
  
P <- partition("GERMAPARLMINI", date = "2009-11-10")
s_attributes(P)
s_attributes(P, "speaker") # get names of speakers



