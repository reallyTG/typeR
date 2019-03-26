library(paleotree)


### Name: equation2function
### Title: Turn a Character String of the Right-Hand Side of an Equation
###   into an R Function
### Aliases: equation2function

### ** Examples

# some simple examples
foo <- equation2function("x+y")
foo
foo(x = 4,y = 0.1)

foo <- equation2function("x+2*sqrt(2*y+3)^2")
foo
foo(x = 4,y = 0.1)

# what about weird long argument names and spaces
foo <- equation2function("stegosaur + 0.4 * P")
foo
foo(stegosaur = 5,P = 0.3)



