library(rpsftm)


### Name: rand
### Title: rand functions to use in the rpsftm() formula
### Aliases: rand

### ** Examples

x <- with(immdef, rand(imm , 1 - xoyrs / progyrs ) )
x
class(x)
y <- as.data.frame(x)
head(y)



