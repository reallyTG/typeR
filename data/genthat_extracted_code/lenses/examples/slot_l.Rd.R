library(lenses)


### Name: slot_l
### Title: Slot lens
### Aliases: slot_l

### ** Examples

new_class <- setClass("new_class", slots = c(x = "numeric"))
(x <- new_class())

view(x, slot_l("x"))
set(x, slot_l("x"), 1:10)



