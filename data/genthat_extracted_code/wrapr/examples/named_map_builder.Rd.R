library(wrapr)


### Name: named_map_builder
### Title: Named map builder.
### Aliases: named_map_builder := %:=%

### ** Examples



c('a' := '4', 'b' := '5')
# equivalent to: c(a = '4', b = '5')

c('a', 'b') := c('1', '2')
# equivalent to: c(a = '1', b = '2')

# the important example
name <- 'a'
name := '5'
# equivalent to: c('a' = '5')

# fn version:
#  applied when right side is {}
#  or when left side is of class formula.

g <- x~y := { x + 3*y }
g(1,100)

f <- ~x := x^2
f(7)

f <- x := { sqrt(x) }
f(7)




