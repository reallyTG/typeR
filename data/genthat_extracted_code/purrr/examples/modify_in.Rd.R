library(purrr)


### Name: modify_in
### Title: Modify a pluck location
### Aliases: modify_in assign_in

### ** Examples

# Recall that pluck() returns a component of a data structure that
# might be arbitrarily deep
x <- list(list(bar = 1, foo = 2))
pluck(x, 1, "foo")

# Use assign_in() to modify the pluck location:
assign_in(x, list(1, "foo"), 100)

# modify_in() applies a function to that location and update the
# element in place:
modify_in(x, list(1, "foo"), ~ .x * 200)

# Additional arguments are passed to the function in the ordinary way:
modify_in(x, list(1, "foo"), `+`, 100)



