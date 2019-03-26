library(soobench)


### Name: soo_function
### Title: Define a new 'soo_function' object.
### Aliases: soo_function

### ** Examples

## Given the following simple benchmark function:
f_my_sphere <- function(x)
  sum((x-1)*(x-1))

## we can define a corresponding 2d soo_function:
f <- soo_function("My Sphere", "my-sphere-2d", f_my_sphere, 2,
                  c(-10, -10), c(10, 10),
                  0, c(1, 1))

## And then plot it:
plot(f)



