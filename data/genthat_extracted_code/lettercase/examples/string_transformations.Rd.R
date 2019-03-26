library(lettercase)


### Name: str_delete_whitespace
### Title: Common string transformations
### Aliases: str_delete_leading_nonword str_delete_nonword
###   str_delete_separators str_delete_space str_delete_whitespace
###   str_expand_capwords

### ** Examples

# TRANSFORMATIONS
  str_ucfirst( "abc def" )              # Abc Def
  str_expand_capwords( "AbcDef")        # Abc Def

# DELETION
  str_delete_whitespace( "ABC 123" )    # ABC123
  str_delete_separators( "A_B-C.123" )  # ABC123
  str_delete_nonword( "ABC & 123" )     # ABC123



