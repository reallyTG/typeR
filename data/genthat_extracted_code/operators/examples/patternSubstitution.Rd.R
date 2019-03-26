library(operators)


### Name: patternSubstitution
### Title: Remove a pattern from a character vector
### Aliases: %-~|% %-~% %o~|% %s~%
### Keywords: utilities

### ** Examples
                        
  txt <- c("arm","foot","lefroo", "bafoobar")
  txt %-~% "foo"
  txt %-~|% "foo"
  
  ### Email of the R core team members
  rcore <- readLines(file.path(R.home("doc"),"AUTHORS")) 
  rcore 
  
  ### or this way
  # angle brackets are retained here
  rcore %o~|% "<.*@.*>"
  rcore %o~|% "<.*@.*>" %-~% "[<>]"
  
  
  # allows to perform the match using < and > but strips them from the result
  rcore %o~|% "<(.*@.*)>"
  
  # really silly english to french translator
  pinks <- colors() %~|% "pink"
  pinks %s~% "/pink/rose/"
  gsub( "pink", "rose", pinks )
  
  # perl regex pink shouter
  pinks %s~% "/(pink)/\\U\\1/p"
  gsub( "(pink)", "\\U\\1", pinks, perl = TRUE )

  # see ?gsub
  gsub("(\\w)(\\w*)", "\\U\\1\\L\\2", "a test of capitalizing", perl=TRUE)
  "a test of capitalizing" %s~% "/(\\w)(\\w*)/\\U\\1\\L\\2/gp"
  



