library(assertive.properties)


### Name: assert_has_slot
### Title: Does the S4 input have a slot?
### Aliases: assert_has_slot has_slot

### ** Examples

setClass("numbers", representation(foo = "numeric"))
x <- new("numbers", foo = 1:10)
has_slot(x, "foo")
has_slot(x, "bar")
has_slot(1:10, "foo")



