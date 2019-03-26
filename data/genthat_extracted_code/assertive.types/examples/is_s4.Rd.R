library(assertive.types)


### Name: assert_is_S4
### Title: Is the input an S4 object?
### Aliases: assert_is_S4 assert_is_ref_class_generator
###   assert_is_ref_class_object assert_is_s4 is_S4 is_ref_class_generator
###   is_ref_class_object is_s4

### ** Examples

assert_is_s4(getClass("MethodDefinition"))
# These examples should fail.
assertive.base::dont_stop(assert_is_s4(1:10))



