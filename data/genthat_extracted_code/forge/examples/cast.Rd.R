library(forge)


### Name: cast
### Title: Cast values into shape
### Aliases: cast cast_integer cast_scalar_integer cast_nullable_integer
###   cast_nullable_scalar_integer cast_integer_list
###   cast_nullable_integer_list cast_double cast_scalar_double
###   cast_nullable_double cast_nullable_scalar_double cast_double_list
###   cast_nullable_double_list cast_character cast_scalar_character
###   cast_nullable_character cast_nullable_scalar_character
###   cast_character_list cast_nullable_character_list cast_string
###   cast_nullable_string cast_string_list cast_nullable_string_list
###   cast_logical cast_scalar_logical cast_nullable_logical
###   cast_nullable_scalar_logical cast_logical_list
###   cast_nullable_logical_list cast_choice

### ** Examples

# Cast a double vector to integer
cast_integer(c(1, 2))

# Cast a numeric to a string
cast_string(4.5)

# Cast an integer vector to a list of doubles
cast_double_list(1:4)




