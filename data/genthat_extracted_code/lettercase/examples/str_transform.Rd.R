library(lettercase)


### Name: str_transform
### Title: str_transform
### Aliases: str_transform

### ** Examples

string = c( "catch-22", "finnegans wake" )
  str_transform( string, str_capitalize )

  str_transform( string, str_capitalize, str_delete_nonword )
  str_delete_nonword( str_capitalize( string ) )      # SAME

  ## Not run: 
##D     # magrittr:
##D     string %>% str_capitalize %>% str_delete_nonword   # SAME
##D   
## End(Not run)



