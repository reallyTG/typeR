library(operators)


### Name: patternFilter
### Title: Regular expression filters
### Aliases: %~|% %!~|%
### Keywords: utilities

### ** Examples
                        
  
  cols <- colors()
  cols %~|% "^blue"
  
  ### blue colors that don't finish with a digit
  ( a1 <- cols %~|% "blue" %!~|% "\\d$"         )
  ( a2 <- cols %~|% "blue[^0-9]*$"                )
  ( a3 <- grep( "blue[^0-9]*", cols, value = TRUE ) )
  
  # using perl regular expressions
  
  ### not necessary since p is in the default of the package
  with( options( operators.regexpr = "p" ), { 
  	( a4 <- grep( "blue[^\\d]*", cols, value = TRUE, perl = TRUE  ) )
  	( a5 <- cols %~|% "blue[^\\d]*$" )
  })
  
  ### blue colors that contain a r
  cols %~|% "blue" %~|% "r"
  grep( "r", grep( "blue", cols, value = TRUE ), value = TRUE  )
  
  ### blue colors that don't contain a r
  cols %~|% "blue" %!~|% "r"
  cols %~|% "^[^r]*blue[^r]*$"
  
  grep( "^[^r]*$", grep( "blue", cols, value = TRUE ), value = TRUE  ) # tricky and verbose
  # or in two steps, ... laborious
  bluecols <- grep( "blue", cols, value = TRUE )
  bluecols[ -grep( "r", bluecols) ]
  



