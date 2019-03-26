library(lettercase)


### Name: str_lowercase
### Title: str_uppercase, str_lowercases
### Aliases: is_all_caps is_allcaps is_lower is_lower_case is_lowercase
###   is_upper is_upper_case is_uppercase lower_case lowercase str_all_caps
###   str_allcaps str_capitalize str_decapitalize str_lower str_lower_case
###   str_lowercase str_upper str_upper_case str_uppercase upper_case
###   uppercase

### ** Examples

str_decapitalize( "ABC" )     # abc
# is_lower_case
  is_lowercase( 'ABC123' )      # FALSE
  is_lowercase( 'abc123' )      # TRUE
  is_lowercase( 'aB'  )         # FALSE
  is_lowercase( '123' )         # TRUE
# str_uppercase
  str_uppercase( "one flew over the cuckoo's nest" )
  str_uppercase( "catch-22" )

  str_capitalize( "abc" )               # ABC
  str_all_caps( "abc" )                 # ABC
# is_uppercase
  is_uppercase( 'ABC123' )      # TRUE
  is_uppercase( 'abc123' )      # FALSE
  is_uppercase( 'aB'  )         # FALSE
  is_uppercase( '123' )         # TRUE



