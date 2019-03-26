library(lettercase)


### Name: str_collapse_whitespace
### Title: Collpases multiple adjacent whitespace characters into one
### Aliases: str_collapse_whitespace str_collapse_ws

### ** Examples

str_collapse_whitespace( "A  B" )
  str_collapse_whitespace( "A  B  C" )
  str_collapse_whitespace( "A__B__C" )
  str_collapse_whitespace( "A  B__C" )
  str_collapse_whitespace( "A _B_ C" )  # No transformation, no matches

  # See note above:
  str_collapse_whitespace( "A _B_ C", '[\\s-_]' ) # possibly ill-defined
  str_collapse_whitespace( "A _B_ C", c("\\s", "_") )
  str_collapse_whitespace( "A _B_ C", '[\\s-_]', " " )



