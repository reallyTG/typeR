library(assertive.types)


### Name: assert_is_externalptr
### Title: Is the input is an external pointer?
### Aliases: assert_is_externalptr is_externalptr

### ** Examples

# The xml2 pkg makes heavy use of external pointers
xptr <- xml2::read_xml("<foo><bar /></foo>")$node
assert_is_externalptr(xptr)

# This should fail
assertive.base::dont_stop({
assert_is_externalptr(NULL)
})



