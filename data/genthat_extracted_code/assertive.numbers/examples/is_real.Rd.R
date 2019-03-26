library(assertive.numbers)


### Name: assert_all_are_imaginary
### Title: Is the input real/imaginary?
### Aliases: assert_all_are_imaginary assert_all_are_real
###   assert_any_are_imaginary assert_any_are_real is_imaginary is_real

### ** Examples

(x <- with(expand.grid(re = -1:1, im = -1:1), re + im * 1i))
is_real(x)
is_imaginary(x)

# By default, very small imaginary/real components are ignored.
x <- .Machine$double.eps * (1 + 1i)
is_real(x)
is_real(x, 0)
is_imaginary(x)
is_imaginary(x, 0)
# numbers with both a real and imaginary component return FALSE
# (since they are neither purely real nor purely imaginary)
cmplx <- 1 + 1i
is_real(cmplx)
is_imaginary(cmplx)
assert_all_are_real(1:10)
assert_all_are_real(1:10 + 0i)
assert_any_are_real(c(1i, 0))
assert_all_are_imaginary(1:10 * 1i)
assert_any_are_imaginary(c(1i, 0))
assertive.base::dont_stop(assert_all_are_real(x))
assertive.base::dont_stop(assert_all_are_imaginary(x))



