library(lenses)


### Name: attr_l
### Title: Construct a lens into an attribute
### Aliases: attr_l

### ** Examples

(x <- structure(1:10, important = "attribute"))
view(x, attr_l("important"))
set(x, attr_l("important"), "feature")



