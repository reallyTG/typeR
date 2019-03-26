library(operators)


### Name: patternDivision
### Title: Divide by a pattern
### Aliases: %/~%
### Keywords: utilities

### ** Examples
                        
  "Separate these  words by spaces" %/~% " +"
  
  ### From ?strsplit
  unlist(strsplit("a.b.c", "\\."))
  "a.b.c" %/~% "\\."
  



