library(lettercase)


### Name: str_is
### Title: Test whether strings are of the specified type
### Aliases: make_str_are make_str_is str_are_upper_case str_are_uppercase
###   str_is str_is_all

### ** Examples

string = c( "catch-22", "finnegans wake" )
  str_is( string, str_lower_case )

  str_transform( string, str_capitalize, str_delete_nonword )
  str_delete_nonword( str_capitalize( string ) )      # SAME

  # magrittr:
  ## Not run: 
##D     string %>% str_capitalize %>% str_delete_nonword   # SAME
##D   
## End(Not run)



