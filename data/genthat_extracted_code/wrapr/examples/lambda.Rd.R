library(wrapr)


### Name: lambda
### Title: Build an anonymous function.
### Aliases: lambda

### ** Examples


#lambda-syntax: lambda(arg [, arg]*, body [, env=env])
# also works with lambda character as function name
# print(intToUtf8(0x03BB))

# example: square numbers
sapply(1:4, lambda(x, x^2))

# example more than one argument
f <- lambda(x, y, x+y)
f(2,4)

# brace interface syntax
f <- x := { x^2 }
f(5)

# formula interface syntax: [~arg|arg(~arg)+] := { body }
f <- x~y := { x + 3 * y }
f(5, 47)




