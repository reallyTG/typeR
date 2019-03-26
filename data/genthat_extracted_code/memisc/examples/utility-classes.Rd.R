library(memisc)


### Name: Utility classes
### Title: Named Lists, Lists of Items, and Atomic Vectors
### Aliases: named.list item.list named.list-class item.list-class
###   initialize,item.list-method initialize,named.list-method
###   coerce,data.set,named.list-method show,named.list-method atomic-class
###   double-class

### ** Examples

new("named.list",a=1,b=2)

# This should generate an error, since the names
# are not unique.
try(new("named.list",a=1,a=2))

# Another error, one name is missing.
try(new("named.list",a=1,2))

# Also an error, the resulting list would be unnamed.
try(new("named.list",1,2))


new("item.list",a=1,b=2)

# Also an error: "item.list"s are "named.lists",
# and here the names would be non-unique.
try(new("item.list",a=1,a=2))



