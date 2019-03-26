library(oppr)


### Name: scalar_parameters
### Title: Scalar parameters
### Aliases: scalar_parameters proportion_parameter binary_parameter
###   integer_parameter numeric_parameter

### ** Examples

# proportion parameter
p1 <- proportion_parameter('prop', 0.5) # create new object
print(p1) # print it
p1$get() # get value
p1$id # get id
p1$validate(5) # check if 5 is a validate input
p1$validate(0.1) # check if 0.1 is a validate input
p1$set(0.1) # change value to 0.1
print(p1)

# binary parameter
p2 <- binary_parameter('bin', 0) # create new object
print(p2) # print it
p2$get() # get value
p2$id # get id
p2$validate(5) # check if 5 is a validate input
p2$validate(1L) # check if 1L is a validate input
p2$set(1L) # change value to 1L
print(p1) # print it again

# integer parameter
p3 <- integer_parameter('int', 5L) # create new object
print(p3) # print it
p3$get() # get value
p3$id # get id
p3$validate(5.6) # check if 5.6 is a validate input
p3$validate(2L) # check if 2L is a validate input
p3$set(2L) # change value to 2L
print(p3) # print it again

# numeric parameter
p4 <- numeric_parameter('dbl', -7.6) # create new object
print(p4) # print it
p4$get() # get value
p4$id # get id
p4$validate(NA) # check if NA is a validate input
p4$validate(8.9) # check if 8.9 is a validate input
p4$set(8.9) # change value to 8.9
print(p4) # print it again

# numeric parameter with lower bounds
p5 <- numeric_parameter('bdbl', 6, lower_limit=0) # create new object
print(p5) # print it
p5$get() # get value
p5$id # get id
p5$validate(-10) # check if -10 is a validate input
p5$validate(90) # check if 90 is a validate input
p5$set(90) # change value to 8.9
print(p5) # print it again




