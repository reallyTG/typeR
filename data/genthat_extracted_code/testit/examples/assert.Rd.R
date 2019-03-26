library(testit)


### Name: assert
### Title: Assertions with an optional message
### Aliases: assert %==%

### ** Examples

## The first way to write assertions -------------------

assert("T is bad for TRUE, and so is F for FALSE", {
    T = FALSE
    F = TRUE
    (T != TRUE)  # note the parentheses
    (F != FALSE)
})

assert("A Poisson random number is non-negative", {
    x = rpois(1, 10)
    (x >= 0)
    (x > -1)  # () is optional because it's the last expression
})


## The second way to write assertions --------------------

assert("one equals one", 1 == 1)
assert("seq and : produce equal sequences", seq(1L, 10L) == 1L:10L)
assert("seq and : produce identical sequences", identical(seq(1L, 10L), 1L:10L))

# multiple tests
T = FALSE
F = TRUE
assert("T is bad for TRUE, and so is F for FALSE", T != TRUE, F != FALSE)

# a mixture of tests
assert("Let's pray all of them will pass", 1 == 1, 1 != 2, letters[4] == "d", 
    rev(rev(letters)) == letters)

# logical(0) cannot pass assert(), although stopifnot() does not care
try(assert("logical(0) cannot pass", 1 == integer(0)))
stopifnot(1 == integer(0))  # it's OK!

# a compound expression
try(assert("this if statement returns TRUE", if (TRUE) {
    x = 1
    x == 2
}))

# no message
assert(!FALSE, TRUE, is.na(NA))



