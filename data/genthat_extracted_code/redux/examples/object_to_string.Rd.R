library(redux)


### Name: object_to_string
### Title: Convert R objects to/from strings
### Aliases: object_to_string string_to_object object_to_bin bin_to_object

### ** Examples

s <- object_to_string(1:10)
s
string_to_object(s)
identical(string_to_object(s), 1:10)



