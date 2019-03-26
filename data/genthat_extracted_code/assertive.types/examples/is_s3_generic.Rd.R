library(assertive.types)


### Name: assert_is_s3_generic
### Title: Is the input an S3 generic or method?
### Aliases: assert_is_s3_generic assert_is_s3_group_generic
###   assert_is_s3_internal_generic assert_is_s3_method
###   assert_is_s3_primitive_generic assert_is_s4_group_generic
###   is_s3_generic is_s3_group_generic is_s3_internal_generic is_s3_method
###   is_s3_primitive_generic is_s4_group_generic

### ** Examples

# General check for S3 generics and methods
is_s3_generic(is.na)
is_s3_method(is.na.data.frame)

# More specific types of S3 generic
is_s3_primitive_generic(c)
is_s3_group_generic(abs)
is_s3_internal_generic(unlist)

# S4 group generics are mostly the same as S3 group generics
is_s4_group_generic(cosh)

# Renaming functions is fine
not <- `!`
is_s3_group_generic(not)

# Some failures
assertive.base::dont_stop({
assert_is_s3_primitive_generic(exp)
assert_is_s4_group_generic(`!`)
})



