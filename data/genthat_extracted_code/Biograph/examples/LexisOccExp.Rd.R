library(Biograph)


### Name: LexisOccExp
### Title: Displays occurrences, exposures and transition rates in a Lexis
###   diagram
### Aliases: LexisOccExp

### ** Examples

# The following example selects the "JN" transitions from the GLHS data 
# and produces Lexis diagrams with age and time intervals of 5 years data (GLHS)
  data (GLHS)
  w <- LexisOccExp (Bdata=GLHS,transition= "JN",nyear=5)



