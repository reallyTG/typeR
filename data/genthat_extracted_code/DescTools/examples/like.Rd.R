library(DescTools)


### Name: %like%
### Title: Like Operator
### Aliases: %like% '%like any%'
### Keywords: manip

### ** Examples

# find names ending on "or"
names(d.pizza) %like% "%or"

# find names starting with "d"
names(d.pizza) %like% "d%"

# ... containing er?
names(d.pizza) %like% "%er%"

# and combined, search for a name containing "un", ending on "or"
# or beginning with "F"
levels(d.pizza$driver) %like any% c("%un%", "%or", "F%")

# the positions on the vector
match(names(d.pizza) %like% "%er%", names(d.pizza))



