library(xptr)


### Name: xptr
### Title: Manipulating External Pointer
### Aliases: xptr xptr-package

### ** Examples

library(xptr)
a <- new_xptr("0x11a888090")
b <- new_xptr("0x11a888098")
is_xpt(a)
xptr_address(a)
xptr_clear(a)
is_null_xptr(a)
set_xptr_address(a, xptr_address(b))
xptr_address(a)



