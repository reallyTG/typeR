library(operators)


### Name: pattern
### Title: Pattern matching operators
### Aliases: %~% %!~% %~*% %!~*% %~+% %!~+%
### Keywords: utilities

### ** Examples
                        
  txt <- c("arm","foot","lefroo", "bafoobar")
  txt %~% "foo"
  txt %!~% "foo"
  txt %~*% "foo"
  txt %~+% "foo"
  txt %!~*% "foo"
  txt %!~+% "foo"
  
  txt %~%   "[a-z]"
  txt %!~%  "[a-z]"
  txt %~*%  "[a-z]"
  txt %~+%  "[a-z]"
  txt %!~*% "[a-z]"
  txt %!~+% "[a-z]"
  
  
  cols <- colors()
  cols[ cols %~% "^blue" ]
  # see also %~|%
  
  
  ## needs perl regular expression for the \\d, see %but%
  with( options( operators.regexpr = "p" ), {
  	cols[ cols %!~% "\\d$" ]
  } )
  



