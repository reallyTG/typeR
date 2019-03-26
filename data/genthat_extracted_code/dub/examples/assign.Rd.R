library(dub)


### Name: %<<-%
### Title: Assign nested components of a list to names
### Aliases: %<<-% %->>%

### ** Examples

# Assign successive components
(one : two : three) %<<-% list(1, 2, 3)
stopifnot(one == 1, two == 2, three == 3)

# Assign nested components
(p : (q : r : (s : t))) %<<-% list(1, list(2, 3, list(4, 5)))
(P : (Q : R : S)) %<<-% list(1, list(2, 3, list(4, 5)))
stopifnot(p == 1, q == 2, r == 3, s == 4, t == 5,
          P == 1, Q == 2, R == 3, identical(S, list(4, 5)))

# Unpack nested components with nested parentheses
(w) %<<-% list(1:3)
(((z))) %<<-% list(list(list("z")))
((x : y)) %<<-% list(list("x", "y"))
stopifnot(w == 1:3, x == "x", y == "y", z == "z")

# Skip a component with a dot (.)
(a : . : b) %<<-% list("a", "skip this", "b")
((c : .) : .) %<<-% list(list("c", "skip this"), "skip this")
stopifnot(a == "a", b == "b", c == "c")

# Skip a range of components with dots (...)
(first : ... : last) %<<-% letters
(. : second : ...) %<<-% letters
(mpg : cyl : ...) %<<-% mtcars
stopifnot(
  first == "a", second == "b", last == "z",
  mpg == mtcars$mpg, cyl == mtcars$cyl
)




