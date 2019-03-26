library(assertive.types)


### Name: assert_is_a_complex
### Title: Is the input complex?
### Aliases: assert_is_a_complex assert_is_complex is_a_complex is_complex

### ** Examples

assert_is_complex(c(1i, 2i))
assert_is_a_complex(1i)
assert_is_a_complex(1 + 0i)
assert_is_a_complex(NA_complex_)
#These examples should fail.
assertive.base::dont_stop(assert_is_complex(1:10))
assertive.base::dont_stop(assert_is_a_complex(c(1i, 2i)))
assertive.base::dont_stop(assert_is_a_complex(complex()))



